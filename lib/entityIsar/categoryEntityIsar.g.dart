// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetCategoryCollection on Isar {
  IsarCollection<Category> get categorys {
    return getCollection('Category');
  }
}

final CategorySchema = CollectionSchema(
  name: 'Category',
  schema:
      '{"name":"Category","idName":"id","properties":[{"name":"categoryDocId","type":"String"},{"name":"categoryName","type":"String"},{"name":"deleteFlg","type":"Bool"},{"name":"insertProgramId","type":"String"},{"name":"insertTime","type":"Long"},{"name":"insertUserDocId","type":"String"},{"name":"photoFile","type":"ByteList"},{"name":"photoNameSuffix","type":"String"},{"name":"photoUpdateCnt","type":"Long"},{"name":"readableFlg","type":"Bool"},{"name":"updateProgramId","type":"String"},{"name":"updateTime","type":"Long"},{"name":"updateUserDocId","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _CategoryNativeAdapter(),
  webAdapter: const _CategoryWebAdapter(),
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
    'updateProgramId': 10,
    'updateTime': 11,
    'updateUserDocId': 12
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

class _CategoryWebAdapter extends IsarWebTypeAdapter<Category> {
  const _CategoryWebAdapter();

  @override
  Object serialize(IsarCollection<Category> collection, Category object) {
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
    IsarNative.jsObjectSet(jsObj, 'updateProgramId', object.updateProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'updateTime', object.updateTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'updateUserDocId', object.updateUserDocId);
    return jsObj;
  }

  @override
  Category deserialize(IsarCollection<Category> collection, dynamic jsObj) {
    final object = Category(
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
  void attachLinks(Isar isar, int id, Category object) {}
}

class _CategoryNativeAdapter extends IsarNativeTypeAdapter<Category> {
  const _CategoryNativeAdapter();

  @override
  void serialize(IsarCollection<Category> collection, IsarRawObject rawObj,
      Category object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
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
    final value10 = object.updateProgramId;
    final _updateProgramId = IsarBinaryWriter.utf8Encoder.convert(value10);
    dynamicSize += (_updateProgramId.length) as int;
    final value11 = object.updateTime;
    final _updateTime = value11;
    final value12 = object.updateUserDocId;
    final _updateUserDocId = IsarBinaryWriter.utf8Encoder.convert(value12);
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
    writer.writeBytes(offsets[10], _updateProgramId);
    writer.writeDateTime(offsets[11], _updateTime);
    writer.writeBytes(offsets[12], _updateUserDocId);
  }

  @override
  Category deserialize(IsarCollection<Category> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Category(
      reader.readString(offsets[0]),
      reader.readString(offsets[1]),
      reader.readBytes(offsets[6]),
      reader.readString(offsets[7]),
      reader.readLong(offsets[8]),
      reader.readString(offsets[5]),
      reader.readString(offsets[3]),
      reader.readDateTime(offsets[4]),
      reader.readString(offsets[12]),
      reader.readString(offsets[10]),
      reader.readDateTime(offsets[11]),
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
        return (reader.readDateTime(offset)) as P;
      case 12:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Category object) {}
}

extension CategoryQueryWhereSort on QueryBuilder<Category, Category, QWhere> {
  QueryBuilder<Category, Category, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension CategoryQueryWhere on QueryBuilder<Category, Category, QWhereClause> {
  QueryBuilder<Category, Category, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Category, Category, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idBetween(
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

extension CategoryQueryFilter
    on QueryBuilder<Category, Category, QFilterCondition> {
  QueryBuilder<Category, Category, QAfterFilterCondition> categoryDocIdEqualTo(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryDocIdGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryDocIdLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryDocIdBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryDocIdStartsWith(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryDocIdEndsWith(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categoryDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categoryDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameEqualTo(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameStartsWith(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameEndsWith(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categoryName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categoryName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> deleteFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleteFlg',
      value: value,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      insertProgramIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      insertProgramIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> insertTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> insertTimeGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> insertTimeLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> insertTimeBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      insertUserDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      insertUserDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixEqualTo(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixStartsWith(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixEndsWith(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'photoNameSuffix',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoNameSuffixMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'photoNameSuffix',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> photoUpdateCntEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'photoUpdateCnt',
      value: value,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoUpdateCntGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      photoUpdateCntLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> photoUpdateCntBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> readableFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readableFlg',
      value: value,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      updateProgramIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      updateProgramIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> updateTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> updateTimeGreaterThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> updateTimeLessThan(
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

  QueryBuilder<Category, Category, QAfterFilterCondition> updateTimeBetween(
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
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

  QueryBuilder<Category, Category, QAfterFilterCondition>
      updateUserDocIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      updateUserDocIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension CategoryQueryLinks
    on QueryBuilder<Category, Category, QFilterCondition> {}

extension CategoryQueryWhereSortBy
    on QueryBuilder<Category, Category, QSortBy> {
  QueryBuilder<Category, Category, QAfterSortBy> sortByCategoryDocId() {
    return addSortByInternal('categoryDocId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByCategoryDocIdDesc() {
    return addSortByInternal('categoryDocId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByCategoryName() {
    return addSortByInternal('categoryName', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByCategoryNameDesc() {
    return addSortByInternal('categoryName', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByPhotoNameSuffix() {
    return addSortByInternal('photoNameSuffix', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByPhotoNameSuffixDesc() {
    return addSortByInternal('photoNameSuffix', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByPhotoUpdateCnt() {
    return addSortByInternal('photoUpdateCnt', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByPhotoUpdateCntDesc() {
    return addSortByInternal('photoUpdateCnt', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }
}

extension CategoryQueryWhereSortThenBy
    on QueryBuilder<Category, Category, QSortThenBy> {
  QueryBuilder<Category, Category, QAfterSortBy> thenByCategoryDocId() {
    return addSortByInternal('categoryDocId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByCategoryDocIdDesc() {
    return addSortByInternal('categoryDocId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByCategoryName() {
    return addSortByInternal('categoryName', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByCategoryNameDesc() {
    return addSortByInternal('categoryName', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByPhotoNameSuffix() {
    return addSortByInternal('photoNameSuffix', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByPhotoNameSuffixDesc() {
    return addSortByInternal('photoNameSuffix', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByPhotoUpdateCnt() {
    return addSortByInternal('photoUpdateCnt', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByPhotoUpdateCntDesc() {
    return addSortByInternal('photoUpdateCnt', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }
}

extension CategoryQueryWhereDistinct
    on QueryBuilder<Category, Category, QDistinct> {
  QueryBuilder<Category, Category, QDistinct> distinctByCategoryDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('categoryDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Category, Category, QDistinct> distinctByCategoryName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('categoryName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Category, Category, QDistinct> distinctByDeleteFlg() {
    return addDistinctByInternal('deleteFlg');
  }

  QueryBuilder<Category, Category, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Category, Category, QDistinct> distinctByInsertProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Category, Category, QDistinct> distinctByInsertTime() {
    return addDistinctByInternal('insertTime');
  }

  QueryBuilder<Category, Category, QDistinct> distinctByInsertUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Category, Category, QDistinct> distinctByPhotoNameSuffix(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('photoNameSuffix',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Category, Category, QDistinct> distinctByPhotoUpdateCnt() {
    return addDistinctByInternal('photoUpdateCnt');
  }

  QueryBuilder<Category, Category, QDistinct> distinctByReadableFlg() {
    return addDistinctByInternal('readableFlg');
  }

  QueryBuilder<Category, Category, QDistinct> distinctByUpdateProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Category, Category, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }

  QueryBuilder<Category, Category, QDistinct> distinctByUpdateUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateUserDocId',
        caseSensitive: caseSensitive);
  }
}

extension CategoryQueryProperty
    on QueryBuilder<Category, Category, QQueryProperty> {
  QueryBuilder<Category, String, QQueryOperations> categoryDocIdProperty() {
    return addPropertyNameInternal('categoryDocId');
  }

  QueryBuilder<Category, String, QQueryOperations> categoryNameProperty() {
    return addPropertyNameInternal('categoryName');
  }

  QueryBuilder<Category, bool, QQueryOperations> deleteFlgProperty() {
    return addPropertyNameInternal('deleteFlg');
  }

  QueryBuilder<Category, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Category, String, QQueryOperations> insertProgramIdProperty() {
    return addPropertyNameInternal('insertProgramId');
  }

  QueryBuilder<Category, DateTime, QQueryOperations> insertTimeProperty() {
    return addPropertyNameInternal('insertTime');
  }

  QueryBuilder<Category, String, QQueryOperations> insertUserDocIdProperty() {
    return addPropertyNameInternal('insertUserDocId');
  }

  QueryBuilder<Category, Uint8List, QQueryOperations> photoFileProperty() {
    return addPropertyNameInternal('photoFile');
  }

  QueryBuilder<Category, String, QQueryOperations> photoNameSuffixProperty() {
    return addPropertyNameInternal('photoNameSuffix');
  }

  QueryBuilder<Category, int, QQueryOperations> photoUpdateCntProperty() {
    return addPropertyNameInternal('photoUpdateCnt');
  }

  QueryBuilder<Category, bool, QQueryOperations> readableFlgProperty() {
    return addPropertyNameInternal('readableFlg');
  }

  QueryBuilder<Category, String, QQueryOperations> updateProgramIdProperty() {
    return addPropertyNameInternal('updateProgramId');
  }

  QueryBuilder<Category, DateTime, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }

  QueryBuilder<Category, String, QQueryOperations> updateUserDocIdProperty() {
    return addPropertyNameInternal('updateUserDocId');
  }
}
