// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatDetailEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetChatDetailCollection on Isar {
  IsarCollection<ChatDetail> get chatDetails {
    return getCollection('ChatDetail');
  }
}

final ChatDetailSchema = CollectionSchema(
  name: 'ChatDetail',
  schema:
      '{"name":"ChatDetail","idName":"id","properties":[{"name":"chatDetailDocId","type":"String"},{"name":"chatHeaderDocId","type":"String"},{"name":"deleteFlg","type":"Bool"},{"name":"fileNameSuffix","type":"String"},{"name":"insertProgramId","type":"String"},{"name":"insertTime","type":"Long"},{"name":"insertUserDocId","type":"String"},{"name":"message","type":"String"},{"name":"messageType","type":"String"},{"name":"readableFlg","type":"Bool"},{"name":"receiverUserDocId","type":"String"},{"name":"referDocId","type":"String"},{"name":"sendTime","type":"Long"},{"name":"senderUserDocId","type":"String"},{"name":"updateProgramId","type":"String"},{"name":"updateTime","type":"Long"},{"name":"updateUserDocId","type":"String"},{"name":"userDocId","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _ChatDetailNativeAdapter(),
  webAdapter: const _ChatDetailWebAdapter(),
  idName: 'id',
  propertyIds: {
    'chatDetailDocId': 0,
    'chatHeaderDocId': 1,
    'deleteFlg': 2,
    'fileNameSuffix': 3,
    'insertProgramId': 4,
    'insertTime': 5,
    'insertUserDocId': 6,
    'message': 7,
    'messageType': 8,
    'readableFlg': 9,
    'receiverUserDocId': 10,
    'referDocId': 11,
    'sendTime': 12,
    'senderUserDocId': 13,
    'updateProgramId': 14,
    'updateTime': 15,
    'updateUserDocId': 16,
    'userDocId': 17
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

class _ChatDetailWebAdapter extends IsarWebTypeAdapter<ChatDetail> {
  const _ChatDetailWebAdapter();

  @override
  Object serialize(IsarCollection<ChatDetail> collection, ChatDetail object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'chatDetailDocId', object.chatDetailDocId);
    IsarNative.jsObjectSet(jsObj, 'chatHeaderDocId', object.chatHeaderDocId);
    IsarNative.jsObjectSet(jsObj, 'deleteFlg', object.deleteFlg);
    IsarNative.jsObjectSet(jsObj, 'fileNameSuffix', object.fileNameSuffix);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'insertProgramId', object.insertProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'insertTime', object.insertTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'insertUserDocId', object.insertUserDocId);
    IsarNative.jsObjectSet(jsObj, 'message', object.message);
    IsarNative.jsObjectSet(jsObj, 'messageType', object.messageType);
    IsarNative.jsObjectSet(jsObj, 'readableFlg', object.readableFlg);
    IsarNative.jsObjectSet(
        jsObj, 'receiverUserDocId', object.receiverUserDocId);
    IsarNative.jsObjectSet(jsObj, 'referDocId', object.referDocId);
    IsarNative.jsObjectSet(
        jsObj, 'sendTime', object.sendTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'senderUserDocId', object.senderUserDocId);
    IsarNative.jsObjectSet(jsObj, 'updateProgramId', object.updateProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'updateTime', object.updateTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'updateUserDocId', object.updateUserDocId);
    IsarNative.jsObjectSet(jsObj, 'userDocId', object.userDocId);
    return jsObj;
  }

  @override
  ChatDetail deserialize(IsarCollection<ChatDetail> collection, dynamic jsObj) {
    final object = ChatDetail(
      IsarNative.jsObjectGet(jsObj, 'chatDetailDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'chatHeaderDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'senderUserDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'receiverUserDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'userDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'messageType') ?? '',
      IsarNative.jsObjectGet(jsObj, 'fileNameSuffix') ?? '',
      IsarNative.jsObjectGet(jsObj, 'referDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'message') ?? '',
      IsarNative.jsObjectGet(jsObj, 'sendTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'sendTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      IsarNative.jsObjectGet(jsObj, 'insertUserDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'insertProgramId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'insertTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'insertTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      IsarNative.jsObjectGet(jsObj, 'updateUserDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'updateProgramId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'updateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'updateTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      IsarNative.jsObjectGet(jsObj, 'readableFlg') ?? false,
      IsarNative.jsObjectGet(jsObj, 'deleteFlg') ?? false,
    );
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'chatDetailDocId':
        return (IsarNative.jsObjectGet(jsObj, 'chatDetailDocId') ?? '') as P;
      case 'chatHeaderDocId':
        return (IsarNative.jsObjectGet(jsObj, 'chatHeaderDocId') ?? '') as P;
      case 'deleteFlg':
        return (IsarNative.jsObjectGet(jsObj, 'deleteFlg') ?? false) as P;
      case 'fileNameSuffix':
        return (IsarNative.jsObjectGet(jsObj, 'fileNameSuffix') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'insertProgramId':
        return (IsarNative.jsObjectGet(jsObj, 'insertProgramId') ?? '') as P;
      case 'insertTime':
        return (IsarNative.jsObjectGet(jsObj, 'insertTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'insertTime'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'insertUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'insertUserDocId') ?? '') as P;
      case 'message':
        return (IsarNative.jsObjectGet(jsObj, 'message') ?? '') as P;
      case 'messageType':
        return (IsarNative.jsObjectGet(jsObj, 'messageType') ?? '') as P;
      case 'readableFlg':
        return (IsarNative.jsObjectGet(jsObj, 'readableFlg') ?? false) as P;
      case 'receiverUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'receiverUserDocId') ?? '') as P;
      case 'referDocId':
        return (IsarNative.jsObjectGet(jsObj, 'referDocId') ?? '') as P;
      case 'sendTime':
        return (IsarNative.jsObjectGet(jsObj, 'sendTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'sendTime'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'senderUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'senderUserDocId') ?? '') as P;
      case 'updateProgramId':
        return (IsarNative.jsObjectGet(jsObj, 'updateProgramId') ?? '') as P;
      case 'updateTime':
        return (IsarNative.jsObjectGet(jsObj, 'updateTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'updateTime'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'updateUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'updateUserDocId') ?? '') as P;
      case 'userDocId':
        return (IsarNative.jsObjectGet(jsObj, 'userDocId') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, ChatDetail object) {}
}

class _ChatDetailNativeAdapter extends IsarNativeTypeAdapter<ChatDetail> {
  const _ChatDetailNativeAdapter();

  @override
  void serialize(
      IsarCollection<ChatDetail> collection,
      IsarRawObject rawObj,
      ChatDetail object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.chatDetailDocId;
    final _chatDetailDocId = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_chatDetailDocId.length) as int;
    final value1 = object.chatHeaderDocId;
    final _chatHeaderDocId = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_chatHeaderDocId.length) as int;
    final value2 = object.deleteFlg;
    final _deleteFlg = value2;
    final value3 = object.fileNameSuffix;
    final _fileNameSuffix = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_fileNameSuffix.length) as int;
    final value4 = object.insertProgramId;
    final _insertProgramId = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_insertProgramId.length) as int;
    final value5 = object.insertTime;
    final _insertTime = value5;
    final value6 = object.insertUserDocId;
    final _insertUserDocId = IsarBinaryWriter.utf8Encoder.convert(value6);
    dynamicSize += (_insertUserDocId.length) as int;
    final value7 = object.message;
    final _message = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_message.length) as int;
    final value8 = object.messageType;
    final _messageType = IsarBinaryWriter.utf8Encoder.convert(value8);
    dynamicSize += (_messageType.length) as int;
    final value9 = object.readableFlg;
    final _readableFlg = value9;
    final value10 = object.receiverUserDocId;
    final _receiverUserDocId = IsarBinaryWriter.utf8Encoder.convert(value10);
    dynamicSize += (_receiverUserDocId.length) as int;
    final value11 = object.referDocId;
    final _referDocId = IsarBinaryWriter.utf8Encoder.convert(value11);
    dynamicSize += (_referDocId.length) as int;
    final value12 = object.sendTime;
    final _sendTime = value12;
    final value13 = object.senderUserDocId;
    final _senderUserDocId = IsarBinaryWriter.utf8Encoder.convert(value13);
    dynamicSize += (_senderUserDocId.length) as int;
    final value14 = object.updateProgramId;
    final _updateProgramId = IsarBinaryWriter.utf8Encoder.convert(value14);
    dynamicSize += (_updateProgramId.length) as int;
    final value15 = object.updateTime;
    final _updateTime = value15;
    final value16 = object.updateUserDocId;
    final _updateUserDocId = IsarBinaryWriter.utf8Encoder.convert(value16);
    dynamicSize += (_updateUserDocId.length) as int;
    final value17 = object.userDocId;
    final _userDocId = IsarBinaryWriter.utf8Encoder.convert(value17);
    dynamicSize += (_userDocId.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _chatDetailDocId);
    writer.writeBytes(offsets[1], _chatHeaderDocId);
    writer.writeBool(offsets[2], _deleteFlg);
    writer.writeBytes(offsets[3], _fileNameSuffix);
    writer.writeBytes(offsets[4], _insertProgramId);
    writer.writeDateTime(offsets[5], _insertTime);
    writer.writeBytes(offsets[6], _insertUserDocId);
    writer.writeBytes(offsets[7], _message);
    writer.writeBytes(offsets[8], _messageType);
    writer.writeBool(offsets[9], _readableFlg);
    writer.writeBytes(offsets[10], _receiverUserDocId);
    writer.writeBytes(offsets[11], _referDocId);
    writer.writeDateTime(offsets[12], _sendTime);
    writer.writeBytes(offsets[13], _senderUserDocId);
    writer.writeBytes(offsets[14], _updateProgramId);
    writer.writeDateTime(offsets[15], _updateTime);
    writer.writeBytes(offsets[16], _updateUserDocId);
    writer.writeBytes(offsets[17], _userDocId);
  }

  @override
  ChatDetail deserialize(IsarCollection<ChatDetail> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = ChatDetail(
      reader.readString(offsets[0]),
      reader.readString(offsets[1]),
      reader.readString(offsets[13]),
      reader.readString(offsets[10]),
      reader.readString(offsets[17]),
      reader.readString(offsets[8]),
      reader.readString(offsets[3]),
      reader.readString(offsets[11]),
      reader.readString(offsets[7]),
      reader.readDateTime(offsets[12]),
      reader.readString(offsets[6]),
      reader.readString(offsets[4]),
      reader.readDateTime(offsets[5]),
      reader.readString(offsets[16]),
      reader.readString(offsets[14]),
      reader.readDateTime(offsets[15]),
      reader.readBool(offsets[9]),
      reader.readBool(offsets[2]),
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
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readBool(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readDateTime(offset)) as P;
      case 6:
        return (reader.readString(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readString(offset)) as P;
      case 9:
        return (reader.readBool(offset)) as P;
      case 10:
        return (reader.readString(offset)) as P;
      case 11:
        return (reader.readString(offset)) as P;
      case 12:
        return (reader.readDateTime(offset)) as P;
      case 13:
        return (reader.readString(offset)) as P;
      case 14:
        return (reader.readString(offset)) as P;
      case 15:
        return (reader.readDateTime(offset)) as P;
      case 16:
        return (reader.readString(offset)) as P;
      case 17:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, ChatDetail object) {}
}

extension ChatDetailQueryWhereSort
    on QueryBuilder<ChatDetail, ChatDetail, QWhere> {
  QueryBuilder<ChatDetail, ChatDetail, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension ChatDetailQueryWhere
    on QueryBuilder<ChatDetail, ChatDetail, QWhereClause> {
  QueryBuilder<ChatDetail, ChatDetail, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterWhereClause> idBetween(
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

extension ChatDetailQueryFilter
    on QueryBuilder<ChatDetail, ChatDetail, QFilterCondition> {
  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chatDetailDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chatDetailDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chatDetailDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chatDetailDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chatDetailDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chatDetailDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chatDetailDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatDetailDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chatDetailDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chatHeaderDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chatHeaderDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chatHeaderDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chatHeaderDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chatHeaderDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chatHeaderDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chatHeaderDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      chatHeaderDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chatHeaderDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> deleteFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleteFlg',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileNameSuffix',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      fileNameSuffixMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileNameSuffix',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdGreaterThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdLessThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdStartsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdEndsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertProgramIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> insertTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> insertTimeBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdGreaterThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdLessThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdStartsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdEndsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      insertUserDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'message',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'message',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'message',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'message',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'message',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'message',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'message',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> messageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'message',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'messageType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'messageType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'messageType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'messageType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'messageType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'messageType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'messageType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      messageTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'messageType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      readableFlgEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readableFlg',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'receiverUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'receiverUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'receiverUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'receiverUserDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'receiverUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'receiverUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'receiverUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      receiverUserDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'receiverUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> referDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'referDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      referDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'referDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      referDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'referDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> referDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'referDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      referDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'referDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      referDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'referDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      referDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'referDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> referDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'referDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> sendTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sendTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      sendTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sendTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> sendTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sendTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> sendTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sendTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'senderUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'senderUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'senderUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'senderUserDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'senderUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'senderUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      senderUserDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdGreaterThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdLessThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdStartsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdEndsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateProgramIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> updateTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> updateTimeBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdGreaterThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdLessThan(
    String value, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdStartsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdEndsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      updateUserDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> userDocIdEqualTo(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      userDocIdGreaterThan(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> userDocIdLessThan(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> userDocIdBetween(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition>
      userDocIdStartsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> userDocIdEndsWith(
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

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> userDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterFilterCondition> userDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ChatDetailQueryLinks
    on QueryBuilder<ChatDetail, ChatDetail, QFilterCondition> {}

extension ChatDetailQueryWhereSortBy
    on QueryBuilder<ChatDetail, ChatDetail, QSortBy> {
  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByChatDetailDocId() {
    return addSortByInternal('chatDetailDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByChatDetailDocIdDesc() {
    return addSortByInternal('chatDetailDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByChatHeaderDocId() {
    return addSortByInternal('chatHeaderDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByChatHeaderDocIdDesc() {
    return addSortByInternal('chatHeaderDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByFileNameSuffix() {
    return addSortByInternal('fileNameSuffix', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByFileNameSuffixDesc() {
    return addSortByInternal('fileNameSuffix', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByMessage() {
    return addSortByInternal('message', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByMessageDesc() {
    return addSortByInternal('message', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByMessageType() {
    return addSortByInternal('messageType', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByMessageTypeDesc() {
    return addSortByInternal('messageType', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByReceiverUserDocId() {
    return addSortByInternal('receiverUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByReceiverUserDocIdDesc() {
    return addSortByInternal('receiverUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByReferDocId() {
    return addSortByInternal('referDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByReferDocIdDesc() {
    return addSortByInternal('referDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortBySendTime() {
    return addSortByInternal('sendTime', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortBySendTimeDesc() {
    return addSortByInternal('sendTime', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortBySenderUserDocId() {
    return addSortByInternal('senderUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortBySenderUserDocIdDesc() {
    return addSortByInternal('senderUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      sortByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByUserDocId() {
    return addSortByInternal('userDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> sortByUserDocIdDesc() {
    return addSortByInternal('userDocId', Sort.desc);
  }
}

extension ChatDetailQueryWhereSortThenBy
    on QueryBuilder<ChatDetail, ChatDetail, QSortThenBy> {
  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByChatDetailDocId() {
    return addSortByInternal('chatDetailDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByChatDetailDocIdDesc() {
    return addSortByInternal('chatDetailDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByChatHeaderDocId() {
    return addSortByInternal('chatHeaderDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByChatHeaderDocIdDesc() {
    return addSortByInternal('chatHeaderDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByFileNameSuffix() {
    return addSortByInternal('fileNameSuffix', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByFileNameSuffixDesc() {
    return addSortByInternal('fileNameSuffix', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByMessage() {
    return addSortByInternal('message', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByMessageDesc() {
    return addSortByInternal('message', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByMessageType() {
    return addSortByInternal('messageType', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByMessageTypeDesc() {
    return addSortByInternal('messageType', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByReceiverUserDocId() {
    return addSortByInternal('receiverUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByReceiverUserDocIdDesc() {
    return addSortByInternal('receiverUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByReferDocId() {
    return addSortByInternal('referDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByReferDocIdDesc() {
    return addSortByInternal('referDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenBySendTime() {
    return addSortByInternal('sendTime', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenBySendTimeDesc() {
    return addSortByInternal('sendTime', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenBySenderUserDocId() {
    return addSortByInternal('senderUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenBySenderUserDocIdDesc() {
    return addSortByInternal('senderUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy>
      thenByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByUserDocId() {
    return addSortByInternal('userDocId', Sort.asc);
  }

  QueryBuilder<ChatDetail, ChatDetail, QAfterSortBy> thenByUserDocIdDesc() {
    return addSortByInternal('userDocId', Sort.desc);
  }
}

extension ChatDetailQueryWhereDistinct
    on QueryBuilder<ChatDetail, ChatDetail, QDistinct> {
  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByChatDetailDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chatDetailDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByChatHeaderDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chatHeaderDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByDeleteFlg() {
    return addDistinctByInternal('deleteFlg');
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByFileNameSuffix(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileNameSuffix',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByInsertProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByInsertTime() {
    return addDistinctByInternal('insertTime');
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByInsertUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByMessage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('message', caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByMessageType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('messageType', caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByReadableFlg() {
    return addDistinctByInternal('readableFlg');
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByReceiverUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('receiverUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByReferDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('referDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctBySendTime() {
    return addDistinctByInternal('sendTime');
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctBySenderUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByUpdateProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByUpdateUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ChatDetail, ChatDetail, QDistinct> distinctByUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userDocId', caseSensitive: caseSensitive);
  }
}

extension ChatDetailQueryProperty
    on QueryBuilder<ChatDetail, ChatDetail, QQueryProperty> {
  QueryBuilder<ChatDetail, String, QQueryOperations> chatDetailDocIdProperty() {
    return addPropertyNameInternal('chatDetailDocId');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> chatHeaderDocIdProperty() {
    return addPropertyNameInternal('chatHeaderDocId');
  }

  QueryBuilder<ChatDetail, bool, QQueryOperations> deleteFlgProperty() {
    return addPropertyNameInternal('deleteFlg');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> fileNameSuffixProperty() {
    return addPropertyNameInternal('fileNameSuffix');
  }

  QueryBuilder<ChatDetail, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> insertProgramIdProperty() {
    return addPropertyNameInternal('insertProgramId');
  }

  QueryBuilder<ChatDetail, DateTime, QQueryOperations> insertTimeProperty() {
    return addPropertyNameInternal('insertTime');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> insertUserDocIdProperty() {
    return addPropertyNameInternal('insertUserDocId');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> messageProperty() {
    return addPropertyNameInternal('message');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> messageTypeProperty() {
    return addPropertyNameInternal('messageType');
  }

  QueryBuilder<ChatDetail, bool, QQueryOperations> readableFlgProperty() {
    return addPropertyNameInternal('readableFlg');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations>
      receiverUserDocIdProperty() {
    return addPropertyNameInternal('receiverUserDocId');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> referDocIdProperty() {
    return addPropertyNameInternal('referDocId');
  }

  QueryBuilder<ChatDetail, DateTime, QQueryOperations> sendTimeProperty() {
    return addPropertyNameInternal('sendTime');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> senderUserDocIdProperty() {
    return addPropertyNameInternal('senderUserDocId');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> updateProgramIdProperty() {
    return addPropertyNameInternal('updateProgramId');
  }

  QueryBuilder<ChatDetail, DateTime, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> updateUserDocIdProperty() {
    return addPropertyNameInternal('updateUserDocId');
  }

  QueryBuilder<ChatDetail, String, QQueryOperations> userDocIdProperty() {
    return addPropertyNameInternal('userDocId');
  }
}
