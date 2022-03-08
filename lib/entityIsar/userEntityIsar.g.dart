// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetUserCollection on Isar {
  IsarCollection<User> get users {
    return getCollection('User');
  }
}

final UserSchema = CollectionSchema(
  name: 'User',
  schema:
      '{"name":"User","idName":"id","properties":[{"name":"age","type":"Long"},{"name":"country","type":"String"},{"name":"deleteFlg","type":"Bool"},{"name":"description","type":"String"},{"name":"email","type":"String"},{"name":"gender","type":"String"},{"name":"greeting","type":"String"},{"name":"homeCountry","type":"String"},{"name":"homeTown","type":"String"},{"name":"informationModifiedTime","type":"Long"},{"name":"insertProgramId","type":"String"},{"name":"insertTime","type":"Long"},{"name":"insertUserDocId","type":"String"},{"name":"interestingCategories","type":"String"},{"name":"interestingCourses","type":"String"},{"name":"level","type":"String"},{"name":"messageTokenId","type":"String"},{"name":"motherTongue","type":"String"},{"name":"name","type":"String"},{"name":"occupation","type":"String"},{"name":"placeWannaGo","type":"String"},{"name":"profilePhotoNameSuffix","type":"String"},{"name":"profilePhotoUpdateCnt","type":"Long"},{"name":"readableFlg","type":"Bool"},{"name":"searchConditionAge","type":"String"},{"name":"searchConditionCountry","type":"String"},{"name":"searchConditionGender","type":"String"},{"name":"searchConditionLevel","type":"String"},{"name":"searchConditionNativeLang","type":"String"},{"name":"town","type":"String"},{"name":"updateProgramId","type":"String"},{"name":"updateTime","type":"Long"},{"name":"updateUserDocId","type":"String"},{"name":"userDocId","type":"String"},{"name":"userType","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _UserNativeAdapter(),
  webAdapter: const _UserWebAdapter(),
  idName: 'id',
  propertyIds: {
    'age': 0,
    'country': 1,
    'deleteFlg': 2,
    'description': 3,
    'email': 4,
    'gender': 5,
    'greeting': 6,
    'homeCountry': 7,
    'homeTown': 8,
    'informationModifiedTime': 9,
    'insertProgramId': 10,
    'insertTime': 11,
    'insertUserDocId': 12,
    'interestingCategories': 13,
    'interestingCourses': 14,
    'level': 15,
    'messageTokenId': 16,
    'motherTongue': 17,
    'name': 18,
    'occupation': 19,
    'placeWannaGo': 20,
    'profilePhotoNameSuffix': 21,
    'profilePhotoUpdateCnt': 22,
    'readableFlg': 23,
    'searchConditionAge': 24,
    'searchConditionCountry': 25,
    'searchConditionGender': 26,
    'searchConditionLevel': 27,
    'searchConditionNativeLang': 28,
    'town': 29,
    'updateProgramId': 30,
    'updateTime': 31,
    'updateUserDocId': 32,
    'userDocId': 33,
    'userType': 34
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _UserWebAdapter extends IsarWebTypeAdapter<User> {
  const _UserWebAdapter();

  @override
  Object serialize(IsarCollection<User> collection, User object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'age', object.age);
    IsarNative.jsObjectSet(jsObj, 'country', object.country);
    IsarNative.jsObjectSet(jsObj, 'deleteFlg', object.deleteFlg);
    IsarNative.jsObjectSet(jsObj, 'description', object.description);
    IsarNative.jsObjectSet(jsObj, 'email', object.email);
    IsarNative.jsObjectSet(jsObj, 'gender', object.gender);
    IsarNative.jsObjectSet(jsObj, 'greeting', object.greeting);
    IsarNative.jsObjectSet(jsObj, 'homeCountry', object.homeCountry);
    IsarNative.jsObjectSet(jsObj, 'homeTown', object.homeTown);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'informationModifiedTime',
        object.informationModifiedTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'insertProgramId', object.insertProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'insertTime', object.insertTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'insertUserDocId', object.insertUserDocId);
    IsarNative.jsObjectSet(
        jsObj, 'interestingCategories', object.interestingCategories);
    IsarNative.jsObjectSet(
        jsObj, 'interestingCourses', object.interestingCourses);
    IsarNative.jsObjectSet(jsObj, 'level', object.level);
    IsarNative.jsObjectSet(jsObj, 'messageTokenId', object.messageTokenId);
    IsarNative.jsObjectSet(jsObj, 'motherTongue', object.motherTongue);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'occupation', object.occupation);
    IsarNative.jsObjectSet(jsObj, 'placeWannaGo', object.placeWannaGo);
    IsarNative.jsObjectSet(
        jsObj, 'profilePhotoNameSuffix', object.profilePhotoNameSuffix);
    IsarNative.jsObjectSet(
        jsObj, 'profilePhotoUpdateCnt', object.profilePhotoUpdateCnt);
    IsarNative.jsObjectSet(jsObj, 'readableFlg', object.readableFlg);
    IsarNative.jsObjectSet(
        jsObj, 'searchConditionAge', object.searchConditionAge);
    IsarNative.jsObjectSet(
        jsObj, 'searchConditionCountry', object.searchConditionCountry);
    IsarNative.jsObjectSet(
        jsObj, 'searchConditionGender', object.searchConditionGender);
    IsarNative.jsObjectSet(
        jsObj, 'searchConditionLevel', object.searchConditionLevel);
    IsarNative.jsObjectSet(
        jsObj, 'searchConditionNativeLang', object.searchConditionNativeLang);
    IsarNative.jsObjectSet(jsObj, 'town', object.town);
    IsarNative.jsObjectSet(jsObj, 'updateProgramId', object.updateProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'updateTime', object.updateTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'updateUserDocId', object.updateUserDocId);
    IsarNative.jsObjectSet(jsObj, 'userDocId', object.userDocId);
    IsarNative.jsObjectSet(jsObj, 'userType', object.userType);
    return jsObj;
  }

  @override
  User deserialize(IsarCollection<User> collection, dynamic jsObj) {
    final object = User(
      IsarNative.jsObjectGet(jsObj, 'userDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'name'),
      IsarNative.jsObjectGet(jsObj, 'email'),
      IsarNative.jsObjectGet(jsObj, 'age'),
      IsarNative.jsObjectGet(jsObj, 'level'),
      IsarNative.jsObjectGet(jsObj, 'occupation'),
      IsarNative.jsObjectGet(jsObj, 'motherTongue'),
      IsarNative.jsObjectGet(jsObj, 'country'),
      IsarNative.jsObjectGet(jsObj, 'town'),
      IsarNative.jsObjectGet(jsObj, 'homeCountry'),
      IsarNative.jsObjectGet(jsObj, 'homeTown'),
      IsarNative.jsObjectGet(jsObj, 'gender'),
      IsarNative.jsObjectGet(jsObj, 'placeWannaGo'),
      IsarNative.jsObjectGet(jsObj, 'greeting'),
      IsarNative.jsObjectGet(jsObj, 'description'),
      IsarNative.jsObjectGet(jsObj, 'userType'),
      IsarNative.jsObjectGet(jsObj, 'searchConditionAge'),
      IsarNative.jsObjectGet(jsObj, 'searchConditionLevel'),
      IsarNative.jsObjectGet(jsObj, 'searchConditionNativeLang'),
      IsarNative.jsObjectGet(jsObj, 'searchConditionCountry'),
      IsarNative.jsObjectGet(jsObj, 'searchConditionGender'),
      IsarNative.jsObjectGet(jsObj, 'profilePhotoNameSuffix'),
      IsarNative.jsObjectGet(jsObj, 'profilePhotoUpdateCnt'),
      IsarNative.jsObjectGet(jsObj, 'messageTokenId'),
      IsarNative.jsObjectGet(jsObj, 'informationModifiedTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'informationModifiedTime'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'interestingCategories'),
      IsarNative.jsObjectGet(jsObj, 'interestingCourses'),
      IsarNative.jsObjectGet(jsObj, 'insertUserDocId'),
      IsarNative.jsObjectGet(jsObj, 'insertProgramId'),
      IsarNative.jsObjectGet(jsObj, 'insertTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'insertTime'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'updateUserDocId'),
      IsarNative.jsObjectGet(jsObj, 'updateProgramId'),
      IsarNative.jsObjectGet(jsObj, 'updateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'updateTime'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'readableFlg'),
      IsarNative.jsObjectGet(jsObj, 'deleteFlg'),
    );
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'age':
        return (IsarNative.jsObjectGet(jsObj, 'age')) as P;
      case 'country':
        return (IsarNative.jsObjectGet(jsObj, 'country')) as P;
      case 'deleteFlg':
        return (IsarNative.jsObjectGet(jsObj, 'deleteFlg')) as P;
      case 'description':
        return (IsarNative.jsObjectGet(jsObj, 'description')) as P;
      case 'email':
        return (IsarNative.jsObjectGet(jsObj, 'email')) as P;
      case 'gender':
        return (IsarNative.jsObjectGet(jsObj, 'gender')) as P;
      case 'greeting':
        return (IsarNative.jsObjectGet(jsObj, 'greeting')) as P;
      case 'homeCountry':
        return (IsarNative.jsObjectGet(jsObj, 'homeCountry')) as P;
      case 'homeTown':
        return (IsarNative.jsObjectGet(jsObj, 'homeTown')) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'informationModifiedTime':
        return (IsarNative.jsObjectGet(jsObj, 'informationModifiedTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'informationModifiedTime'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'insertProgramId':
        return (IsarNative.jsObjectGet(jsObj, 'insertProgramId')) as P;
      case 'insertTime':
        return (IsarNative.jsObjectGet(jsObj, 'insertTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'insertTime'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'insertUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'insertUserDocId')) as P;
      case 'interestingCategories':
        return (IsarNative.jsObjectGet(jsObj, 'interestingCategories')) as P;
      case 'interestingCourses':
        return (IsarNative.jsObjectGet(jsObj, 'interestingCourses')) as P;
      case 'level':
        return (IsarNative.jsObjectGet(jsObj, 'level')) as P;
      case 'messageTokenId':
        return (IsarNative.jsObjectGet(jsObj, 'messageTokenId')) as P;
      case 'motherTongue':
        return (IsarNative.jsObjectGet(jsObj, 'motherTongue')) as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name')) as P;
      case 'occupation':
        return (IsarNative.jsObjectGet(jsObj, 'occupation')) as P;
      case 'placeWannaGo':
        return (IsarNative.jsObjectGet(jsObj, 'placeWannaGo')) as P;
      case 'profilePhotoNameSuffix':
        return (IsarNative.jsObjectGet(jsObj, 'profilePhotoNameSuffix')) as P;
      case 'profilePhotoUpdateCnt':
        return (IsarNative.jsObjectGet(jsObj, 'profilePhotoUpdateCnt')) as P;
      case 'readableFlg':
        return (IsarNative.jsObjectGet(jsObj, 'readableFlg')) as P;
      case 'searchConditionAge':
        return (IsarNative.jsObjectGet(jsObj, 'searchConditionAge')) as P;
      case 'searchConditionCountry':
        return (IsarNative.jsObjectGet(jsObj, 'searchConditionCountry')) as P;
      case 'searchConditionGender':
        return (IsarNative.jsObjectGet(jsObj, 'searchConditionGender')) as P;
      case 'searchConditionLevel':
        return (IsarNative.jsObjectGet(jsObj, 'searchConditionLevel')) as P;
      case 'searchConditionNativeLang':
        return (IsarNative.jsObjectGet(jsObj, 'searchConditionNativeLang'))
            as P;
      case 'town':
        return (IsarNative.jsObjectGet(jsObj, 'town')) as P;
      case 'updateProgramId':
        return (IsarNative.jsObjectGet(jsObj, 'updateProgramId')) as P;
      case 'updateTime':
        return (IsarNative.jsObjectGet(jsObj, 'updateTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'updateTime'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'updateUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'updateUserDocId')) as P;
      case 'userDocId':
        return (IsarNative.jsObjectGet(jsObj, 'userDocId') ?? '') as P;
      case 'userType':
        return (IsarNative.jsObjectGet(jsObj, 'userType')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, User object) {}
}

class _UserNativeAdapter extends IsarNativeTypeAdapter<User> {
  const _UserNativeAdapter();

  @override
  void serialize(IsarCollection<User> collection, IsarRawObject rawObj,
      User object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.age;
    final _age = value0;
    final value1 = object.country;
    IsarUint8List? _country;
    if (value1 != null) {
      _country = IsarBinaryWriter.utf8Encoder.convert(value1);
    }
    dynamicSize += (_country?.length ?? 0) as int;
    final value2 = object.deleteFlg;
    final _deleteFlg = value2;
    final value3 = object.description;
    IsarUint8List? _description;
    if (value3 != null) {
      _description = IsarBinaryWriter.utf8Encoder.convert(value3);
    }
    dynamicSize += (_description?.length ?? 0) as int;
    final value4 = object.email;
    IsarUint8List? _email;
    if (value4 != null) {
      _email = IsarBinaryWriter.utf8Encoder.convert(value4);
    }
    dynamicSize += (_email?.length ?? 0) as int;
    final value5 = object.gender;
    IsarUint8List? _gender;
    if (value5 != null) {
      _gender = IsarBinaryWriter.utf8Encoder.convert(value5);
    }
    dynamicSize += (_gender?.length ?? 0) as int;
    final value6 = object.greeting;
    IsarUint8List? _greeting;
    if (value6 != null) {
      _greeting = IsarBinaryWriter.utf8Encoder.convert(value6);
    }
    dynamicSize += (_greeting?.length ?? 0) as int;
    final value7 = object.homeCountry;
    IsarUint8List? _homeCountry;
    if (value7 != null) {
      _homeCountry = IsarBinaryWriter.utf8Encoder.convert(value7);
    }
    dynamicSize += (_homeCountry?.length ?? 0) as int;
    final value8 = object.homeTown;
    IsarUint8List? _homeTown;
    if (value8 != null) {
      _homeTown = IsarBinaryWriter.utf8Encoder.convert(value8);
    }
    dynamicSize += (_homeTown?.length ?? 0) as int;
    final value9 = object.informationModifiedTime;
    final _informationModifiedTime = value9;
    final value10 = object.insertProgramId;
    IsarUint8List? _insertProgramId;
    if (value10 != null) {
      _insertProgramId = IsarBinaryWriter.utf8Encoder.convert(value10);
    }
    dynamicSize += (_insertProgramId?.length ?? 0) as int;
    final value11 = object.insertTime;
    final _insertTime = value11;
    final value12 = object.insertUserDocId;
    IsarUint8List? _insertUserDocId;
    if (value12 != null) {
      _insertUserDocId = IsarBinaryWriter.utf8Encoder.convert(value12);
    }
    dynamicSize += (_insertUserDocId?.length ?? 0) as int;
    final value13 = object.interestingCategories;
    IsarUint8List? _interestingCategories;
    if (value13 != null) {
      _interestingCategories = IsarBinaryWriter.utf8Encoder.convert(value13);
    }
    dynamicSize += (_interestingCategories?.length ?? 0) as int;
    final value14 = object.interestingCourses;
    IsarUint8List? _interestingCourses;
    if (value14 != null) {
      _interestingCourses = IsarBinaryWriter.utf8Encoder.convert(value14);
    }
    dynamicSize += (_interestingCourses?.length ?? 0) as int;
    final value15 = object.level;
    IsarUint8List? _level;
    if (value15 != null) {
      _level = IsarBinaryWriter.utf8Encoder.convert(value15);
    }
    dynamicSize += (_level?.length ?? 0) as int;
    final value16 = object.messageTokenId;
    IsarUint8List? _messageTokenId;
    if (value16 != null) {
      _messageTokenId = IsarBinaryWriter.utf8Encoder.convert(value16);
    }
    dynamicSize += (_messageTokenId?.length ?? 0) as int;
    final value17 = object.motherTongue;
    IsarUint8List? _motherTongue;
    if (value17 != null) {
      _motherTongue = IsarBinaryWriter.utf8Encoder.convert(value17);
    }
    dynamicSize += (_motherTongue?.length ?? 0) as int;
    final value18 = object.name;
    IsarUint8List? _name;
    if (value18 != null) {
      _name = IsarBinaryWriter.utf8Encoder.convert(value18);
    }
    dynamicSize += (_name?.length ?? 0) as int;
    final value19 = object.occupation;
    IsarUint8List? _occupation;
    if (value19 != null) {
      _occupation = IsarBinaryWriter.utf8Encoder.convert(value19);
    }
    dynamicSize += (_occupation?.length ?? 0) as int;
    final value20 = object.placeWannaGo;
    IsarUint8List? _placeWannaGo;
    if (value20 != null) {
      _placeWannaGo = IsarBinaryWriter.utf8Encoder.convert(value20);
    }
    dynamicSize += (_placeWannaGo?.length ?? 0) as int;
    final value21 = object.profilePhotoNameSuffix;
    IsarUint8List? _profilePhotoNameSuffix;
    if (value21 != null) {
      _profilePhotoNameSuffix = IsarBinaryWriter.utf8Encoder.convert(value21);
    }
    dynamicSize += (_profilePhotoNameSuffix?.length ?? 0) as int;
    final value22 = object.profilePhotoUpdateCnt;
    final _profilePhotoUpdateCnt = value22;
    final value23 = object.readableFlg;
    final _readableFlg = value23;
    final value24 = object.searchConditionAge;
    IsarUint8List? _searchConditionAge;
    if (value24 != null) {
      _searchConditionAge = IsarBinaryWriter.utf8Encoder.convert(value24);
    }
    dynamicSize += (_searchConditionAge?.length ?? 0) as int;
    final value25 = object.searchConditionCountry;
    IsarUint8List? _searchConditionCountry;
    if (value25 != null) {
      _searchConditionCountry = IsarBinaryWriter.utf8Encoder.convert(value25);
    }
    dynamicSize += (_searchConditionCountry?.length ?? 0) as int;
    final value26 = object.searchConditionGender;
    IsarUint8List? _searchConditionGender;
    if (value26 != null) {
      _searchConditionGender = IsarBinaryWriter.utf8Encoder.convert(value26);
    }
    dynamicSize += (_searchConditionGender?.length ?? 0) as int;
    final value27 = object.searchConditionLevel;
    IsarUint8List? _searchConditionLevel;
    if (value27 != null) {
      _searchConditionLevel = IsarBinaryWriter.utf8Encoder.convert(value27);
    }
    dynamicSize += (_searchConditionLevel?.length ?? 0) as int;
    final value28 = object.searchConditionNativeLang;
    IsarUint8List? _searchConditionNativeLang;
    if (value28 != null) {
      _searchConditionNativeLang =
          IsarBinaryWriter.utf8Encoder.convert(value28);
    }
    dynamicSize += (_searchConditionNativeLang?.length ?? 0) as int;
    final value29 = object.town;
    IsarUint8List? _town;
    if (value29 != null) {
      _town = IsarBinaryWriter.utf8Encoder.convert(value29);
    }
    dynamicSize += (_town?.length ?? 0) as int;
    final value30 = object.updateProgramId;
    IsarUint8List? _updateProgramId;
    if (value30 != null) {
      _updateProgramId = IsarBinaryWriter.utf8Encoder.convert(value30);
    }
    dynamicSize += (_updateProgramId?.length ?? 0) as int;
    final value31 = object.updateTime;
    final _updateTime = value31;
    final value32 = object.updateUserDocId;
    IsarUint8List? _updateUserDocId;
    if (value32 != null) {
      _updateUserDocId = IsarBinaryWriter.utf8Encoder.convert(value32);
    }
    dynamicSize += (_updateUserDocId?.length ?? 0) as int;
    final value33 = object.userDocId;
    final _userDocId = IsarBinaryWriter.utf8Encoder.convert(value33);
    dynamicSize += (_userDocId.length) as int;
    final value34 = object.userType;
    IsarUint8List? _userType;
    if (value34 != null) {
      _userType = IsarBinaryWriter.utf8Encoder.convert(value34);
    }
    dynamicSize += (_userType?.length ?? 0) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _age);
    writer.writeBytes(offsets[1], _country);
    writer.writeBool(offsets[2], _deleteFlg);
    writer.writeBytes(offsets[3], _description);
    writer.writeBytes(offsets[4], _email);
    writer.writeBytes(offsets[5], _gender);
    writer.writeBytes(offsets[6], _greeting);
    writer.writeBytes(offsets[7], _homeCountry);
    writer.writeBytes(offsets[8], _homeTown);
    writer.writeDateTime(offsets[9], _informationModifiedTime);
    writer.writeBytes(offsets[10], _insertProgramId);
    writer.writeDateTime(offsets[11], _insertTime);
    writer.writeBytes(offsets[12], _insertUserDocId);
    writer.writeBytes(offsets[13], _interestingCategories);
    writer.writeBytes(offsets[14], _interestingCourses);
    writer.writeBytes(offsets[15], _level);
    writer.writeBytes(offsets[16], _messageTokenId);
    writer.writeBytes(offsets[17], _motherTongue);
    writer.writeBytes(offsets[18], _name);
    writer.writeBytes(offsets[19], _occupation);
    writer.writeBytes(offsets[20], _placeWannaGo);
    writer.writeBytes(offsets[21], _profilePhotoNameSuffix);
    writer.writeLong(offsets[22], _profilePhotoUpdateCnt);
    writer.writeBool(offsets[23], _readableFlg);
    writer.writeBytes(offsets[24], _searchConditionAge);
    writer.writeBytes(offsets[25], _searchConditionCountry);
    writer.writeBytes(offsets[26], _searchConditionGender);
    writer.writeBytes(offsets[27], _searchConditionLevel);
    writer.writeBytes(offsets[28], _searchConditionNativeLang);
    writer.writeBytes(offsets[29], _town);
    writer.writeBytes(offsets[30], _updateProgramId);
    writer.writeDateTime(offsets[31], _updateTime);
    writer.writeBytes(offsets[32], _updateUserDocId);
    writer.writeBytes(offsets[33], _userDocId);
    writer.writeBytes(offsets[34], _userType);
  }

  @override
  User deserialize(IsarCollection<User> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = User(
      reader.readString(offsets[33]),
      reader.readStringOrNull(offsets[18]),
      reader.readStringOrNull(offsets[4]),
      reader.readLongOrNull(offsets[0]),
      reader.readStringOrNull(offsets[15]),
      reader.readStringOrNull(offsets[19]),
      reader.readStringOrNull(offsets[17]),
      reader.readStringOrNull(offsets[1]),
      reader.readStringOrNull(offsets[29]),
      reader.readStringOrNull(offsets[7]),
      reader.readStringOrNull(offsets[8]),
      reader.readStringOrNull(offsets[5]),
      reader.readStringOrNull(offsets[20]),
      reader.readStringOrNull(offsets[6]),
      reader.readStringOrNull(offsets[3]),
      reader.readStringOrNull(offsets[34]),
      reader.readStringOrNull(offsets[24]),
      reader.readStringOrNull(offsets[27]),
      reader.readStringOrNull(offsets[28]),
      reader.readStringOrNull(offsets[25]),
      reader.readStringOrNull(offsets[26]),
      reader.readStringOrNull(offsets[21]),
      reader.readLongOrNull(offsets[22]),
      reader.readStringOrNull(offsets[16]),
      reader.readDateTimeOrNull(offsets[9]),
      reader.readStringOrNull(offsets[13]),
      reader.readStringOrNull(offsets[14]),
      reader.readStringOrNull(offsets[12]),
      reader.readStringOrNull(offsets[10]),
      reader.readDateTimeOrNull(offsets[11]),
      reader.readStringOrNull(offsets[32]),
      reader.readStringOrNull(offsets[30]),
      reader.readDateTimeOrNull(offsets[31]),
      reader.readBoolOrNull(offsets[23]),
      reader.readBoolOrNull(offsets[2]),
    );
    object.id = id;
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLongOrNull(offset)) as P;
      case 1:
        return (reader.readStringOrNull(offset)) as P;
      case 2:
        return (reader.readBoolOrNull(offset)) as P;
      case 3:
        return (reader.readStringOrNull(offset)) as P;
      case 4:
        return (reader.readStringOrNull(offset)) as P;
      case 5:
        return (reader.readStringOrNull(offset)) as P;
      case 6:
        return (reader.readStringOrNull(offset)) as P;
      case 7:
        return (reader.readStringOrNull(offset)) as P;
      case 8:
        return (reader.readStringOrNull(offset)) as P;
      case 9:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 10:
        return (reader.readStringOrNull(offset)) as P;
      case 11:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 12:
        return (reader.readStringOrNull(offset)) as P;
      case 13:
        return (reader.readStringOrNull(offset)) as P;
      case 14:
        return (reader.readStringOrNull(offset)) as P;
      case 15:
        return (reader.readStringOrNull(offset)) as P;
      case 16:
        return (reader.readStringOrNull(offset)) as P;
      case 17:
        return (reader.readStringOrNull(offset)) as P;
      case 18:
        return (reader.readStringOrNull(offset)) as P;
      case 19:
        return (reader.readStringOrNull(offset)) as P;
      case 20:
        return (reader.readStringOrNull(offset)) as P;
      case 21:
        return (reader.readStringOrNull(offset)) as P;
      case 22:
        return (reader.readLongOrNull(offset)) as P;
      case 23:
        return (reader.readBoolOrNull(offset)) as P;
      case 24:
        return (reader.readStringOrNull(offset)) as P;
      case 25:
        return (reader.readStringOrNull(offset)) as P;
      case 26:
        return (reader.readStringOrNull(offset)) as P;
      case 27:
        return (reader.readStringOrNull(offset)) as P;
      case 28:
        return (reader.readStringOrNull(offset)) as P;
      case 29:
        return (reader.readStringOrNull(offset)) as P;
      case 30:
        return (reader.readStringOrNull(offset)) as P;
      case 31:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 32:
        return (reader.readStringOrNull(offset)) as P;
      case 33:
        return (reader.readString(offset)) as P;
      case 34:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, User object) {}
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> ageIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'age',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> ageEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'age',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'country',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'country',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> countryMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'country',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> deleteFlgIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'deleteFlg',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> deleteFlgEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleteFlg',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'description',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'email',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'email',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'email',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'gender',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'gender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'gender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'gender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'gender',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'gender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'gender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'gender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> genderMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'gender',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'greeting',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'greeting',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'greeting',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'greeting',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'greeting',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'greeting',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'greeting',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'greeting',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> greetingMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'greeting',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'homeCountry',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'homeCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'homeCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'homeCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'homeCountry',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'homeCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'homeCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'homeCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeCountryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'homeCountry',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'homeTown',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'homeTown',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'homeTown',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'homeTown',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'homeTown',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'homeTown',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'homeTown',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'homeTown',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> homeTownMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'homeTown',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      informationModifiedTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'informationModifiedTime',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      informationModifiedTimeEqualTo(DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'informationModifiedTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      informationModifiedTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'informationModifiedTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      informationModifiedTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'informationModifiedTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      informationModifiedTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'informationModifiedTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'insertProgramId',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'insertProgramId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'insertTime',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'insertTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'insertUserDocId',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'insertUserDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> insertUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      interestingCategoriesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'interestingCategories',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCategoriesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'interestingCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      interestingCategoriesGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'interestingCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCategoriesLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'interestingCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCategoriesBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'interestingCategories',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      interestingCategoriesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'interestingCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCategoriesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'interestingCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCategoriesContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'interestingCategories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCategoriesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'interestingCategories',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'interestingCourses',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'interestingCourses',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'interestingCourses',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'interestingCourses',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'interestingCourses',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'interestingCourses',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'interestingCourses',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'interestingCourses',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> interestingCoursesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'interestingCourses',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'level',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'level',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'level',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'level',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'level',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'level',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'level',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'level',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> levelMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'level',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'messageTokenId',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'messageTokenId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'messageTokenId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'messageTokenId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'messageTokenId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'messageTokenId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'messageTokenId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'messageTokenId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> messageTokenIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'messageTokenId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'motherTongue',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'motherTongue',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'motherTongue',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'motherTongue',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'motherTongue',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'motherTongue',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'motherTongue',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'motherTongue',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> motherTongueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'motherTongue',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'name',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'occupation',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'occupation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'occupation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'occupation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'occupation',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'occupation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'occupation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'occupation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> occupationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'occupation',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'placeWannaGo',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'placeWannaGo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'placeWannaGo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'placeWannaGo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'placeWannaGo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'placeWannaGo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'placeWannaGo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'placeWannaGo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> placeWannaGoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'placeWannaGo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoNameSuffixIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'profilePhotoNameSuffix',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> profilePhotoNameSuffixEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'profilePhotoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoNameSuffixGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'profilePhotoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoNameSuffixLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'profilePhotoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> profilePhotoNameSuffixBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'profilePhotoNameSuffix',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoNameSuffixStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'profilePhotoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoNameSuffixEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'profilePhotoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoNameSuffixContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'profilePhotoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> profilePhotoNameSuffixMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'profilePhotoNameSuffix',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoUpdateCntIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'profilePhotoUpdateCnt',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> profilePhotoUpdateCntEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'profilePhotoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      profilePhotoUpdateCntGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'profilePhotoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> profilePhotoUpdateCntLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'profilePhotoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> profilePhotoUpdateCntBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'profilePhotoUpdateCnt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> readableFlgIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'readableFlg',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> readableFlgEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readableFlg',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'searchConditionAge',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'searchConditionAge',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'searchConditionAge',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'searchConditionAge',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'searchConditionAge',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'searchConditionAge',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'searchConditionAge',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'searchConditionAge',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionAgeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'searchConditionAge',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionCountryIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'searchConditionCountry',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionCountryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'searchConditionCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionCountryGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'searchConditionCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionCountryLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'searchConditionCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionCountryBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'searchConditionCountry',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionCountryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'searchConditionCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionCountryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'searchConditionCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionCountryContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'searchConditionCountry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionCountryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'searchConditionCountry',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionGenderIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'searchConditionGender',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionGenderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'searchConditionGender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionGenderGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'searchConditionGender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionGenderLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'searchConditionGender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionGenderBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'searchConditionGender',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionGenderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'searchConditionGender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionGenderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'searchConditionGender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionGenderContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'searchConditionGender',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionGenderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'searchConditionGender',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'searchConditionLevel',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'searchConditionLevel',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionLevelGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'searchConditionLevel',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'searchConditionLevel',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'searchConditionLevel',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'searchConditionLevel',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'searchConditionLevel',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'searchConditionLevel',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> searchConditionLevelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'searchConditionLevel',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'searchConditionNativeLang',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'searchConditionNativeLang',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'searchConditionNativeLang',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'searchConditionNativeLang',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'searchConditionNativeLang',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'searchConditionNativeLang',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'searchConditionNativeLang',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'searchConditionNativeLang',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition>
      searchConditionNativeLangMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'searchConditionNativeLang',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'town',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'town',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'town',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'town',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'town',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'town',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'town',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'town',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> townMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'town',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'updateProgramId',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updateProgramId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'updateTime',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updateTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'updateUserDocId',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updateUserDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> updateUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'userDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'userType',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'userType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'userType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'userType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'userType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'userType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'userType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> userTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQueryWhereSortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByCountry() {
    return addSortByInternal('country', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByCountryDesc() {
    return addSortByInternal('country', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByGender() {
    return addSortByInternal('gender', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByGenderDesc() {
    return addSortByInternal('gender', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByGreeting() {
    return addSortByInternal('greeting', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByGreetingDesc() {
    return addSortByInternal('greeting', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHomeCountry() {
    return addSortByInternal('homeCountry', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHomeCountryDesc() {
    return addSortByInternal('homeCountry', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHomeTown() {
    return addSortByInternal('homeTown', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByHomeTownDesc() {
    return addSortByInternal('homeTown', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInformationModifiedTime() {
    return addSortByInternal('informationModifiedTime', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInformationModifiedTimeDesc() {
    return addSortByInternal('informationModifiedTime', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInterestingCategories() {
    return addSortByInternal('interestingCategories', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInterestingCategoriesDesc() {
    return addSortByInternal('interestingCategories', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInterestingCourses() {
    return addSortByInternal('interestingCourses', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByInterestingCoursesDesc() {
    return addSortByInternal('interestingCourses', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLevel() {
    return addSortByInternal('level', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLevelDesc() {
    return addSortByInternal('level', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByMessageTokenId() {
    return addSortByInternal('messageTokenId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByMessageTokenIdDesc() {
    return addSortByInternal('messageTokenId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByMotherTongue() {
    return addSortByInternal('motherTongue', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByMotherTongueDesc() {
    return addSortByInternal('motherTongue', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByOccupation() {
    return addSortByInternal('occupation', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByOccupationDesc() {
    return addSortByInternal('occupation', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPlaceWannaGo() {
    return addSortByInternal('placeWannaGo', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPlaceWannaGoDesc() {
    return addSortByInternal('placeWannaGo', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByProfilePhotoNameSuffix() {
    return addSortByInternal('profilePhotoNameSuffix', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByProfilePhotoNameSuffixDesc() {
    return addSortByInternal('profilePhotoNameSuffix', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByProfilePhotoUpdateCnt() {
    return addSortByInternal('profilePhotoUpdateCnt', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByProfilePhotoUpdateCntDesc() {
    return addSortByInternal('profilePhotoUpdateCnt', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionAge() {
    return addSortByInternal('searchConditionAge', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionAgeDesc() {
    return addSortByInternal('searchConditionAge', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionCountry() {
    return addSortByInternal('searchConditionCountry', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionCountryDesc() {
    return addSortByInternal('searchConditionCountry', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionGender() {
    return addSortByInternal('searchConditionGender', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionGenderDesc() {
    return addSortByInternal('searchConditionGender', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionLevel() {
    return addSortByInternal('searchConditionLevel', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionLevelDesc() {
    return addSortByInternal('searchConditionLevel', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionNativeLang() {
    return addSortByInternal('searchConditionNativeLang', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBySearchConditionNativeLangDesc() {
    return addSortByInternal('searchConditionNativeLang', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByTown() {
    return addSortByInternal('town', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByTownDesc() {
    return addSortByInternal('town', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUserDocId() {
    return addSortByInternal('userDocId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUserDocIdDesc() {
    return addSortByInternal('userDocId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUserType() {
    return addSortByInternal('userType', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUserTypeDesc() {
    return addSortByInternal('userType', Sort.desc);
  }
}

extension UserQueryWhereSortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByCountry() {
    return addSortByInternal('country', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByCountryDesc() {
    return addSortByInternal('country', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByGender() {
    return addSortByInternal('gender', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByGenderDesc() {
    return addSortByInternal('gender', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByGreeting() {
    return addSortByInternal('greeting', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByGreetingDesc() {
    return addSortByInternal('greeting', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHomeCountry() {
    return addSortByInternal('homeCountry', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHomeCountryDesc() {
    return addSortByInternal('homeCountry', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHomeTown() {
    return addSortByInternal('homeTown', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByHomeTownDesc() {
    return addSortByInternal('homeTown', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInformationModifiedTime() {
    return addSortByInternal('informationModifiedTime', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInformationModifiedTimeDesc() {
    return addSortByInternal('informationModifiedTime', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInterestingCategories() {
    return addSortByInternal('interestingCategories', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInterestingCategoriesDesc() {
    return addSortByInternal('interestingCategories', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInterestingCourses() {
    return addSortByInternal('interestingCourses', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByInterestingCoursesDesc() {
    return addSortByInternal('interestingCourses', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLevel() {
    return addSortByInternal('level', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLevelDesc() {
    return addSortByInternal('level', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByMessageTokenId() {
    return addSortByInternal('messageTokenId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByMessageTokenIdDesc() {
    return addSortByInternal('messageTokenId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByMotherTongue() {
    return addSortByInternal('motherTongue', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByMotherTongueDesc() {
    return addSortByInternal('motherTongue', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByOccupation() {
    return addSortByInternal('occupation', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByOccupationDesc() {
    return addSortByInternal('occupation', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPlaceWannaGo() {
    return addSortByInternal('placeWannaGo', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPlaceWannaGoDesc() {
    return addSortByInternal('placeWannaGo', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByProfilePhotoNameSuffix() {
    return addSortByInternal('profilePhotoNameSuffix', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByProfilePhotoNameSuffixDesc() {
    return addSortByInternal('profilePhotoNameSuffix', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByProfilePhotoUpdateCnt() {
    return addSortByInternal('profilePhotoUpdateCnt', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByProfilePhotoUpdateCntDesc() {
    return addSortByInternal('profilePhotoUpdateCnt', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionAge() {
    return addSortByInternal('searchConditionAge', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionAgeDesc() {
    return addSortByInternal('searchConditionAge', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionCountry() {
    return addSortByInternal('searchConditionCountry', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionCountryDesc() {
    return addSortByInternal('searchConditionCountry', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionGender() {
    return addSortByInternal('searchConditionGender', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionGenderDesc() {
    return addSortByInternal('searchConditionGender', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionLevel() {
    return addSortByInternal('searchConditionLevel', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionLevelDesc() {
    return addSortByInternal('searchConditionLevel', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionNativeLang() {
    return addSortByInternal('searchConditionNativeLang', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBySearchConditionNativeLangDesc() {
    return addSortByInternal('searchConditionNativeLang', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByTown() {
    return addSortByInternal('town', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByTownDesc() {
    return addSortByInternal('town', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserDocId() {
    return addSortByInternal('userDocId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserDocIdDesc() {
    return addSortByInternal('userDocId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserType() {
    return addSortByInternal('userType', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserTypeDesc() {
    return addSortByInternal('userType', Sort.desc);
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByAge() {
    return addDistinctByInternal('age');
  }

  QueryBuilder<User, User, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('country', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByDeleteFlg() {
    return addDistinctByInternal('deleteFlg');
  }

  QueryBuilder<User, User, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('email', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('gender', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByGreeting(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('greeting', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByHomeCountry(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('homeCountry', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByHomeTown(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('homeTown', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<User, User, QDistinct> distinctByInformationModifiedTime() {
    return addDistinctByInternal('informationModifiedTime');
  }

  QueryBuilder<User, User, QDistinct> distinctByInsertProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByInsertTime() {
    return addDistinctByInternal('insertTime');
  }

  QueryBuilder<User, User, QDistinct> distinctByInsertUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByInterestingCategories(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('interestingCategories',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByInterestingCourses(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('interestingCourses',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByLevel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('level', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByMessageTokenId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('messageTokenId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByMotherTongue(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('motherTongue', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByOccupation(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('occupation', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByPlaceWannaGo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('placeWannaGo', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByProfilePhotoNameSuffix(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('profilePhotoNameSuffix',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByProfilePhotoUpdateCnt() {
    return addDistinctByInternal('profilePhotoUpdateCnt');
  }

  QueryBuilder<User, User, QDistinct> distinctByReadableFlg() {
    return addDistinctByInternal('readableFlg');
  }

  QueryBuilder<User, User, QDistinct> distinctBySearchConditionAge(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('searchConditionAge',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctBySearchConditionCountry(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('searchConditionCountry',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctBySearchConditionGender(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('searchConditionGender',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctBySearchConditionLevel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('searchConditionLevel',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctBySearchConditionNativeLang(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('searchConditionNativeLang',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByTown(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('town', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByUpdateProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }

  QueryBuilder<User, User, QDistinct> distinctByUpdateUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByUserType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userType', caseSensitive: caseSensitive);
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int?, QQueryOperations> ageProperty() {
    return addPropertyNameInternal('age');
  }

  QueryBuilder<User, String?, QQueryOperations> countryProperty() {
    return addPropertyNameInternal('country');
  }

  QueryBuilder<User, bool?, QQueryOperations> deleteFlgProperty() {
    return addPropertyNameInternal('deleteFlg');
  }

  QueryBuilder<User, String?, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<User, String?, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<User, String?, QQueryOperations> genderProperty() {
    return addPropertyNameInternal('gender');
  }

  QueryBuilder<User, String?, QQueryOperations> greetingProperty() {
    return addPropertyNameInternal('greeting');
  }

  QueryBuilder<User, String?, QQueryOperations> homeCountryProperty() {
    return addPropertyNameInternal('homeCountry');
  }

  QueryBuilder<User, String?, QQueryOperations> homeTownProperty() {
    return addPropertyNameInternal('homeTown');
  }

  QueryBuilder<User, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<User, DateTime?, QQueryOperations>
      informationModifiedTimeProperty() {
    return addPropertyNameInternal('informationModifiedTime');
  }

  QueryBuilder<User, String?, QQueryOperations> insertProgramIdProperty() {
    return addPropertyNameInternal('insertProgramId');
  }

  QueryBuilder<User, DateTime?, QQueryOperations> insertTimeProperty() {
    return addPropertyNameInternal('insertTime');
  }

  QueryBuilder<User, String?, QQueryOperations> insertUserDocIdProperty() {
    return addPropertyNameInternal('insertUserDocId');
  }

  QueryBuilder<User, String?, QQueryOperations>
      interestingCategoriesProperty() {
    return addPropertyNameInternal('interestingCategories');
  }

  QueryBuilder<User, String?, QQueryOperations> interestingCoursesProperty() {
    return addPropertyNameInternal('interestingCourses');
  }

  QueryBuilder<User, String?, QQueryOperations> levelProperty() {
    return addPropertyNameInternal('level');
  }

  QueryBuilder<User, String?, QQueryOperations> messageTokenIdProperty() {
    return addPropertyNameInternal('messageTokenId');
  }

  QueryBuilder<User, String?, QQueryOperations> motherTongueProperty() {
    return addPropertyNameInternal('motherTongue');
  }

  QueryBuilder<User, String?, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<User, String?, QQueryOperations> occupationProperty() {
    return addPropertyNameInternal('occupation');
  }

  QueryBuilder<User, String?, QQueryOperations> placeWannaGoProperty() {
    return addPropertyNameInternal('placeWannaGo');
  }

  QueryBuilder<User, String?, QQueryOperations>
      profilePhotoNameSuffixProperty() {
    return addPropertyNameInternal('profilePhotoNameSuffix');
  }

  QueryBuilder<User, int?, QQueryOperations> profilePhotoUpdateCntProperty() {
    return addPropertyNameInternal('profilePhotoUpdateCnt');
  }

  QueryBuilder<User, bool?, QQueryOperations> readableFlgProperty() {
    return addPropertyNameInternal('readableFlg');
  }

  QueryBuilder<User, String?, QQueryOperations> searchConditionAgeProperty() {
    return addPropertyNameInternal('searchConditionAge');
  }

  QueryBuilder<User, String?, QQueryOperations>
      searchConditionCountryProperty() {
    return addPropertyNameInternal('searchConditionCountry');
  }

  QueryBuilder<User, String?, QQueryOperations>
      searchConditionGenderProperty() {
    return addPropertyNameInternal('searchConditionGender');
  }

  QueryBuilder<User, String?, QQueryOperations> searchConditionLevelProperty() {
    return addPropertyNameInternal('searchConditionLevel');
  }

  QueryBuilder<User, String?, QQueryOperations>
      searchConditionNativeLangProperty() {
    return addPropertyNameInternal('searchConditionNativeLang');
  }

  QueryBuilder<User, String?, QQueryOperations> townProperty() {
    return addPropertyNameInternal('town');
  }

  QueryBuilder<User, String?, QQueryOperations> updateProgramIdProperty() {
    return addPropertyNameInternal('updateProgramId');
  }

  QueryBuilder<User, DateTime?, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }

  QueryBuilder<User, String?, QQueryOperations> updateUserDocIdProperty() {
    return addPropertyNameInternal('updateUserDocId');
  }

  QueryBuilder<User, String, QQueryOperations> userDocIdProperty() {
    return addPropertyNameInternal('userDocId');
  }

  QueryBuilder<User, String?, QQueryOperations> userTypeProperty() {
    return addPropertyNameInternal('userType');
  }
}
