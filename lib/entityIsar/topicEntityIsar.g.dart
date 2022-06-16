// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topicEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetTopicCollection on Isar {
  IsarCollection<Topic> get topics {
    return getCollection('Topic');
  }
}

final TopicSchema = CollectionSchema(
  name: 'Topic',
  schema:
      '{"name":"Topic","idName":"id","properties":[{"name":"categoryDocId","type":"String"},{"name":"categoryName","type":"String"},{"name":"deleteFlg","type":"Bool"},{"name":"insertProgramId","type":"String"},{"name":"insertTime","type":"Long"},{"name":"insertUserDocId","type":"String"},{"name":"photoFile","type":"ByteList"},{"name":"photoNameSuffix","type":"String"},{"name":"photoUpdateCnt","type":"Long"},{"name":"readableFlg","type":"Bool"},{"name":"topicDocId","type":"String"},{"name":"topicName","type":"String"},{"name":"updateProgramId","type":"String"},{"name":"updateTime","type":"Long"},{"name":"updateUserDocId","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _TopicNativeAdapter(),
  webAdapter: const _TopicWebAdapter(),
  idName: 'id',
  propertyIds: {
    'categoryDocId': 0,
    'categoryName': 1,
    'deleteFlg': 2,
    'insertProgramId': 3,
    'insertTime': 4,
    'insertUserDocId': 5,
    'photoFile': 6,
    'photoNameSuffix': 7,
    'photoUpdateCnt': 8,
    'readableFlg': 9,
    'topicDocId': 10,
    'topicName': 11,
    'updateProgramId': 12,
    'updateTime': 13,
    'updateUserDocId': 14
  },
  listProperties: {'photoFile'},
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

class _TopicWebAdapter extends IsarWebTypeAdapter<Topic> {
  const _TopicWebAdapter();

  @override
  Object serialize(IsarCollection<Topic> collection, Topic object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'categoryDocId', object.categoryDocId);
    IsarNative.jsObjectSet(jsObj, 'categoryName', object.categoryName);
    IsarNative.jsObjectSet(jsObj, 'deleteFlg', object.deleteFlg);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'insertProgramId', object.insertProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'insertTime', object.insertTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'insertUserDocId', object.insertUserDocId);
    IsarNative.jsObjectSet(jsObj, 'photoFile', object.photoFile);
    IsarNative.jsObjectSet(jsObj, 'photoNameSuffix', object.photoNameSuffix);
    IsarNative.jsObjectSet(jsObj, 'photoUpdateCnt', object.photoUpdateCnt);
    IsarNative.jsObjectSet(jsObj, 'readableFlg', object.readableFlg);
    IsarNative.jsObjectSet(jsObj, 'topicDocId', object.topicDocId);
    IsarNative.jsObjectSet(jsObj, 'topicName', object.topicName);
    IsarNative.jsObjectSet(jsObj, 'updateProgramId', object.updateProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'updateTime', object.updateTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'updateUserDocId', object.updateUserDocId);
    return jsObj;
  }

  @override
  Topic deserialize(IsarCollection<Topic> collection, dynamic jsObj) {
    final object = Topic(
      IsarNative.jsObjectGet(jsObj, 'topicDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'topicName') ?? '',
      IsarNative.jsObjectGet(jsObj, 'categoryDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'categoryName') ?? '',
      IsarNative.jsObjectGet(jsObj, 'photoFile') ?? Uint8List(0),
      IsarNative.jsObjectGet(jsObj, 'photoNameSuffix') ?? '',
      IsarNative.jsObjectGet(jsObj, 'photoUpdateCnt') ??
          double.negativeInfinity,
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
      case 'categoryDocId':
        return (IsarNative.jsObjectGet(jsObj, 'categoryDocId') ?? '') as P;
      case 'categoryName':
        return (IsarNative.jsObjectGet(jsObj, 'categoryName') ?? '') as P;
      case 'deleteFlg':
        return (IsarNative.jsObjectGet(jsObj, 'deleteFlg') ?? false) as P;
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
      case 'photoFile':
        return (IsarNative.jsObjectGet(jsObj, 'photoFile') ?? Uint8List(0))
            as P;
      case 'photoNameSuffix':
        return (IsarNative.jsObjectGet(jsObj, 'photoNameSuffix') ?? '') as P;
      case 'photoUpdateCnt':
        return (IsarNative.jsObjectGet(jsObj, 'photoUpdateCnt') ??
            double.negativeInfinity) as P;
      case 'readableFlg':
        return (IsarNative.jsObjectGet(jsObj, 'readableFlg') ?? false) as P;
      case 'topicDocId':
        return (IsarNative.jsObjectGet(jsObj, 'topicDocId') ?? '') as P;
      case 'topicName':
        return (IsarNative.jsObjectGet(jsObj, 'topicName') ?? '') as P;
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
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Topic object) {}
}

class _TopicNativeAdapter extends IsarNativeTypeAdapter<Topic> {
  const _TopicNativeAdapter();

  @override
  void serialize(IsarCollection<Topic> collection, IsarRawObject rawObj,
      Topic object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.categoryDocId;
    final _categoryDocId = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_categoryDocId.length) as int;
    final value1 = object.categoryName;
    final _categoryName = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_categoryName.length) as int;
    final value2 = object.deleteFlg;
    final _deleteFlg = value2;
    final value3 = object.insertProgramId;
    final _insertProgramId = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_insertProgramId.length) as int;
    final value4 = object.insertTime;
    final _insertTime = value4;
    final value5 = object.insertUserDocId;
    final _insertUserDocId = IsarBinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += (_insertUserDocId.length) as int;
    final value6 = object.photoFile;
    dynamicSize += (value6.length) * 1;
    final _photoFile = value6;
    final value7 = object.photoNameSuffix;
    final _photoNameSuffix = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_photoNameSuffix.length) as int;
    final value8 = object.photoUpdateCnt;
    final _photoUpdateCnt = value8;
    final value9 = object.readableFlg;
    final _readableFlg = value9;
    final value10 = object.topicDocId;
    final _topicDocId = IsarBinaryWriter.utf8Encoder.convert(value10);
    dynamicSize += (_topicDocId.length) as int;
    final value11 = object.topicName;
    final _topicName = IsarBinaryWriter.utf8Encoder.convert(value11);
    dynamicSize += (_topicName.length) as int;
    final value12 = object.updateProgramId;
    final _updateProgramId = IsarBinaryWriter.utf8Encoder.convert(value12);
    dynamicSize += (_updateProgramId.length) as int;
    final value13 = object.updateTime;
    final _updateTime = value13;
    final value14 = object.updateUserDocId;
    final _updateUserDocId = IsarBinaryWriter.utf8Encoder.convert(value14);
    dynamicSize += (_updateUserDocId.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _categoryDocId);
    writer.writeBytes(offsets[1], _categoryName);
    writer.writeBool(offsets[2], _deleteFlg);
    writer.writeBytes(offsets[3], _insertProgramId);
    writer.writeDateTime(offsets[4], _insertTime);
    writer.writeBytes(offsets[5], _insertUserDocId);
    writer.writeBytes(offsets[6], _photoFile);
    writer.writeBytes(offsets[7], _photoNameSuffix);
    writer.writeLong(offsets[8], _photoUpdateCnt);
    writer.writeBool(offsets[9], _readableFlg);
    writer.writeBytes(offsets[10], _topicDocId);
    writer.writeBytes(offsets[11], _topicName);
    writer.writeBytes(offsets[12], _updateProgramId);
    writer.writeDateTime(offsets[13], _updateTime);
    writer.writeBytes(offsets[14], _updateUserDocId);
  }

  @override
  Topic deserialize(IsarCollection<Topic> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Topic(
      reader.readString(offsets[10]),
      reader.readString(offsets[11]),
      reader.readString(offsets[0]),
      reader.readString(offsets[1]),
      reader.readBytes(offsets[6]),
      reader.readString(offsets[7]),
      reader.readLong(offsets[8]),
      reader.readString(offsets[5]),
      reader.readString(offsets[3]),
      reader.readDateTime(offsets[4]),
      reader.readString(offsets[14]),
      reader.readString(offsets[12]),
      reader.readDateTime(offsets[13]),
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
        return (reader.readDateTime(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readBytes(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readLong(offset)) as P;
      case 9:
        return (reader.readBool(offset)) as P;
      case 10:
        return (reader.readString(offset)) as P;
      case 11:
        return (reader.readString(offset)) as P;
      case 12:
        return (reader.readString(offset)) as P;
      case 13:
        return (reader.readDateTime(offset)) as P;
      case 14:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Topic object) {}
}

extension TopicQueryWhereSort on QueryBuilder<Topic, Topic, QWhere> {
  QueryBuilder<Topic, Topic, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension TopicQueryWhere on QueryBuilder<Topic, Topic, QWhereClause> {
  QueryBuilder<Topic, Topic, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Topic, Topic, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterWhereClause> idBetween(
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

extension TopicQueryFilter on QueryBuilder<Topic, Topic, QFilterCondition> {
  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'categoryDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categoryDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'categoryName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> categoryNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categoryName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> deleteFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleteFlg',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdEqualTo(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdStartsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdEndsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertTimeGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertTimeLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertTimeBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdEqualTo(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdStartsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdEndsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> insertUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'photoNameSuffix',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoNameSuffixMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'photoNameSuffix',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoUpdateCntEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'photoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoUpdateCntGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'photoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoUpdateCntLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'photoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> photoUpdateCntBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'photoUpdateCnt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> readableFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readableFlg',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'topicDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'topicDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'topicDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'topicDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'topicDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'topicDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'topicDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'topicDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'topicName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'topicName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'topicName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'topicName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'topicName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'topicName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'topicName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> topicNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'topicName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdEqualTo(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdStartsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdEndsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateTimeGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateTimeLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateTimeBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdEqualTo(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdGreaterThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdLessThan(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdBetween(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdStartsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdEndsWith(
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

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Topic, Topic, QAfterFilterCondition> updateUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TopicQueryLinks on QueryBuilder<Topic, Topic, QFilterCondition> {}

extension TopicQueryWhereSortBy on QueryBuilder<Topic, Topic, QSortBy> {
  QueryBuilder<Topic, Topic, QAfterSortBy> sortByCategoryDocId() {
    return addSortByInternal('categoryDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByCategoryDocIdDesc() {
    return addSortByInternal('categoryDocId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByCategoryName() {
    return addSortByInternal('categoryName', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByCategoryNameDesc() {
    return addSortByInternal('categoryName', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByPhotoNameSuffix() {
    return addSortByInternal('photoNameSuffix', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByPhotoNameSuffixDesc() {
    return addSortByInternal('photoNameSuffix', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByPhotoUpdateCnt() {
    return addSortByInternal('photoUpdateCnt', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByPhotoUpdateCntDesc() {
    return addSortByInternal('photoUpdateCnt', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByTopicDocId() {
    return addSortByInternal('topicDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByTopicDocIdDesc() {
    return addSortByInternal('topicDocId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByTopicName() {
    return addSortByInternal('topicName', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByTopicNameDesc() {
    return addSortByInternal('topicName', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> sortByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }
}

extension TopicQueryWhereSortThenBy on QueryBuilder<Topic, Topic, QSortThenBy> {
  QueryBuilder<Topic, Topic, QAfterSortBy> thenByCategoryDocId() {
    return addSortByInternal('categoryDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByCategoryDocIdDesc() {
    return addSortByInternal('categoryDocId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByCategoryName() {
    return addSortByInternal('categoryName', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByCategoryNameDesc() {
    return addSortByInternal('categoryName', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByPhotoNameSuffix() {
    return addSortByInternal('photoNameSuffix', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByPhotoNameSuffixDesc() {
    return addSortByInternal('photoNameSuffix', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByPhotoUpdateCnt() {
    return addSortByInternal('photoUpdateCnt', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByPhotoUpdateCntDesc() {
    return addSortByInternal('photoUpdateCnt', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByTopicDocId() {
    return addSortByInternal('topicDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByTopicDocIdDesc() {
    return addSortByInternal('topicDocId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByTopicName() {
    return addSortByInternal('topicName', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByTopicNameDesc() {
    return addSortByInternal('topicName', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Topic, Topic, QAfterSortBy> thenByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }
}

extension TopicQueryWhereDistinct on QueryBuilder<Topic, Topic, QDistinct> {
  QueryBuilder<Topic, Topic, QDistinct> distinctByCategoryDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('categoryDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByCategoryName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('categoryName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByDeleteFlg() {
    return addDistinctByInternal('deleteFlg');
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByInsertProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByInsertTime() {
    return addDistinctByInternal('insertTime');
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByInsertUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByPhotoNameSuffix(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('photoNameSuffix',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByPhotoUpdateCnt() {
    return addDistinctByInternal('photoUpdateCnt');
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByReadableFlg() {
    return addDistinctByInternal('readableFlg');
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByTopicDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('topicDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByTopicName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('topicName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByUpdateProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }

  QueryBuilder<Topic, Topic, QDistinct> distinctByUpdateUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateUserDocId',
        caseSensitive: caseSensitive);
  }
}

extension TopicQueryProperty on QueryBuilder<Topic, Topic, QQueryProperty> {
  QueryBuilder<Topic, String, QQueryOperations> categoryDocIdProperty() {
    return addPropertyNameInternal('categoryDocId');
  }

  QueryBuilder<Topic, String, QQueryOperations> categoryNameProperty() {
    return addPropertyNameInternal('categoryName');
  }

  QueryBuilder<Topic, bool, QQueryOperations> deleteFlgProperty() {
    return addPropertyNameInternal('deleteFlg');
  }

  QueryBuilder<Topic, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Topic, String, QQueryOperations> insertProgramIdProperty() {
    return addPropertyNameInternal('insertProgramId');
  }

  QueryBuilder<Topic, DateTime, QQueryOperations> insertTimeProperty() {
    return addPropertyNameInternal('insertTime');
  }

  QueryBuilder<Topic, String, QQueryOperations> insertUserDocIdProperty() {
    return addPropertyNameInternal('insertUserDocId');
  }

  QueryBuilder<Topic, Uint8List, QQueryOperations> photoFileProperty() {
    return addPropertyNameInternal('photoFile');
  }

  QueryBuilder<Topic, String, QQueryOperations> photoNameSuffixProperty() {
    return addPropertyNameInternal('photoNameSuffix');
  }

  QueryBuilder<Topic, int, QQueryOperations> photoUpdateCntProperty() {
    return addPropertyNameInternal('photoUpdateCnt');
  }

  QueryBuilder<Topic, bool, QQueryOperations> readableFlgProperty() {
    return addPropertyNameInternal('readableFlg');
  }

  QueryBuilder<Topic, String, QQueryOperations> topicDocIdProperty() {
    return addPropertyNameInternal('topicDocId');
  }

  QueryBuilder<Topic, String, QQueryOperations> topicNameProperty() {
    return addPropertyNameInternal('topicName');
  }

  QueryBuilder<Topic, String, QQueryOperations> updateProgramIdProperty() {
    return addPropertyNameInternal('updateProgramId');
  }

  QueryBuilder<Topic, DateTime, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }

  QueryBuilder<Topic, String, QQueryOperations> updateUserDocIdProperty() {
    return addPropertyNameInternal('updateUserDocId');
  }
}
