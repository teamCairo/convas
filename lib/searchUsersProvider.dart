import 'dart:developer';
import 'package:algolia/algolia.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daoAlgolia/usersDaoAlgolia.dart';


final searchUsersProvider = ChangeNotifierProvider(
      (ref) => SearchUsersNotifier(),
);

class SearchUsersNotifier extends ChangeNotifier {
  List<AlgoliaObjectSnapshot> _searchResultList = [];

  get searchResultList => _searchResultList;

  Map<String, Image?> _friendImage = {};

  get friendImage => _friendImage;

  void clear() {
    _searchResultList = [];
    _friendImage = {};
  }

  Future<void> searchUsers(ref)async {

    _searchResultList = await selectUsersByConditions(ref);
    setFriendPhoto();
    notifyListeners();

  }



  Future<void> setFriendPhoto() async {
    _friendImage.clear();
    FirebaseStorage storage = FirebaseStorage.instance;

    for (int i = 0; i < _searchResultList.length; i++) {
      String profilePhotoNameSuffix =
      _searchResultList[i].data["profilePhotoNameSuffix"];

      if (profilePhotoNameSuffix != "") {
        //写真が登録されている場合

        try {
          Reference imageRef = storage
              .ref()
              .child("profile")
              .child(_searchResultList[i].data["objectID"]!)
              .child("mainPhoto_small" + profilePhotoNameSuffix);
          await imageRef.getDownloadURL().then((imageUrl) {
            _friendImage[_searchResultList[i].data["objectID"]!] =
                Image.network(imageUrl, width: 90);
          });
        } catch (e) {
          //写真があるはずなのになぜかエラーだった
          log("写真あるはずなのになぜかエラーだった");
          _friendImage[_searchResultList[i].data["objectID"]!] = null;
        }
      } else {
        //写真が登録されていない場合

        _friendImage[_searchResultList[i].data["objectID"]!] = null;
      }
    }
  }
}
