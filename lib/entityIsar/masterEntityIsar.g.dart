// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masterEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetMasterCollection on Isar {
  IsarCollection<Master> get masters {
    return getCollection('Master');
  }
}

final MasterSchema = CollectionSchema(
  name: 'Master',
  schema:
      '{"name":"Master","idName":"id","properties":[{"name":"code","type":"String"},{"name":"deleteFlg","type":"Bool"},{"name":"fileNameSuffix1","type":"String"},{"name":"fileNameSuffix2","type":"String"},{"name":"insertProgramId","type":"String"},{"name":"insertTime","type":"Long"},{"name":"insertUserDocId","type":"String"},{"name":"masterDocId","type":"String"},{"name":"masterGroupCode","type":"String"},{"name":"name","type":"String"},{"name":"onMemoryFlg","type":"Bool"},{"name":"optionBool1","type":"Bool"},{"name":"optionBool2","type":"Bool"},{"name":"optionFile1","type":"ByteList"},{"name":"optionFile2","type":"ByteList"},{"name":"optionNumber1","type":"Long"},{"name":"optionNumber2","type":"Long"},{"name":"optionTIme2","type":"Long"},{"name":"optionText1","type":"String"},{"name":"optionText2","type":"String"},{"name":"optionTime1","type":"Long"},{"name":"readableFlg","type":"Bool"},{"name":"updateProgramId","type":"String"},{"name":"updateTime","type":"Long"},{"name":"updateUserDocId","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _MasterNativeAdapter(),
  webAdapter: const _MasterWebAdapter(),
  idName: 'id',
  propertyIds: {
    'code': 0,
    'deleteFlg': 1,
    'fileNameSuffix1': 2,
    'fileNameSuffix2': 3,
    'insertProgramId': 4,
    'insertTime': 5,
    'insertUserDocId': 6,
    'masterDocId': 7,
    'masterGroupCode': 8,
    'name': 9,
    'onMemoryFlg': 10,
    'optionBool1': 11,
    'optionBool2': 12,
    'optionFile1': 13,
    'optionFile2': 14,
    'optionNumber1': 15,
    'optionNumber2': 16,
    'optionTIme2': 17,
    'optionText1': 18,
    'optionText2': 19,
    'optionTime1': 20,
    'readableFlg': 21,
    'updateProgramId': 22,
    'updateTime': 23,
    'updateUserDocId': 24
  },
  listProperties: {'optionFile1', 'optionFile2'},
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

class _MasterWebAdapter extends IsarWebTypeAdapter<Master> {
  const _MasterWebAdapter();

  @override
  Object serialize(IsarCollection<Master> collection, Master object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'code', object.code);
    IsarNative.jsObjectSet(jsObj, 'deleteFlg', object.deleteFlg);
    IsarNative.jsObjectSet(jsObj, 'fileNameSuffix1', object.fileNameSuffix1);
    IsarNative.jsObjectSet(jsObj, 'fileNameSuffix2', object.fileNameSuffix2);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'insertProgramId', object.insertProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'insertTime', object.insertTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'insertUserDocId', object.insertUserDocId);
    IsarNative.jsObjectSet(jsObj, 'masterDocId', object.masterDocId);
    IsarNative.jsObjectSet(jsObj, 'masterGroupCode', object.masterGroupCode);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'onMemoryFlg', object.onMemoryFlg);
    IsarNative.jsObjectSet(jsObj, 'optionBool1', object.optionBool1);
    IsarNative.jsObjectSet(jsObj, 'optionBool2', object.optionBool2);
    IsarNative.jsObjectSet(jsObj, 'optionFile1', object.optionFile1);
    IsarNative.jsObjectSet(jsObj, 'optionFile2', object.optionFile2);
    IsarNative.jsObjectSet(jsObj, 'optionNumber1', object.optionNumber1);
    IsarNative.jsObjectSet(jsObj, 'optionNumber2', object.optionNumber2);
    IsarNative.jsObjectSet(jsObj, 'optionTIme2',
        object.optionTIme2?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'optionText1', object.optionText1);
    IsarNative.jsObjectSet(jsObj, 'optionText2', object.optionText2);
    IsarNative.jsObjectSet(jsObj, 'optionTime1',
        object.optionTime1?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'readableFlg', object.readableFlg);
    IsarNative.jsObjectSet(jsObj, 'updateProgramId', object.updateProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'updateTime', object.updateTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'updateUserDocId', object.updateUserDocId);
    return jsObj;
  }

  @override
  Master deserialize(IsarCollection<Master> collection, dynamic jsObj) {
    final object = Master(
      IsarNative.jsObjectGet(jsObj, 'masterDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'masterGroupCode') ?? '',
      IsarNative.jsObjectGet(jsObj, 'code') ?? '',
      IsarNative.jsObjectGet(jsObj, 'name') ?? '',
      IsarNative.jsObjectGet(jsObj, 'onMemoryFlg') ?? false,
      IsarNative.jsObjectGet(jsObj, 'optionTime1') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'optionTime1'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'optionTIme2') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'optionTIme2'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'optionNumber1'),
      IsarNative.jsObjectGet(jsObj, 'optionNumber2'),
      IsarNative.jsObjectGet(jsObj, 'optionText1'),
      IsarNative.jsObjectGet(jsObj, 'optionText2'),
      IsarNative.jsObjectGet(jsObj, 'optionBool1'),
      IsarNative.jsObjectGet(jsObj, 'optionBool2'),
      IsarNative.jsObjectGet(jsObj, 'optionFile1'),
      IsarNative.jsObjectGet(jsObj, 'optionFile2'),
      IsarNative.jsObjectGet(jsObj, 'fileNameSuffix1') ?? '',
      IsarNative.jsObjectGet(jsObj, 'fileNameSuffix2') ?? '',
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
      case 'code':
        return (IsarNative.jsObjectGet(jsObj, 'code') ?? '') as P;
      case 'deleteFlg':
        return (IsarNative.jsObjectGet(jsObj, 'deleteFlg')) as P;
      case 'fileNameSuffix1':
        return (IsarNative.jsObjectGet(jsObj, 'fileNameSuffix1') ?? '') as P;
      case 'fileNameSuffix2':
        return (IsarNative.jsObjectGet(jsObj, 'fileNameSuffix2') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
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
      case 'masterDocId':
        return (IsarNative.jsObjectGet(jsObj, 'masterDocId') ?? '') as P;
      case 'masterGroupCode':
        return (IsarNative.jsObjectGet(jsObj, 'masterGroupCode') ?? '') as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      case 'onMemoryFlg':
        return (IsarNative.jsObjectGet(jsObj, 'onMemoryFlg') ?? false) as P;
      case 'optionBool1':
        return (IsarNative.jsObjectGet(jsObj, 'optionBool1')) as P;
      case 'optionBool2':
        return (IsarNative.jsObjectGet(jsObj, 'optionBool2')) as P;
      case 'optionFile1':
        return (IsarNative.jsObjectGet(jsObj, 'optionFile1')) as P;
      case 'optionFile2':
        return (IsarNative.jsObjectGet(jsObj, 'optionFile2')) as P;
      case 'optionNumber1':
        return (IsarNative.jsObjectGet(jsObj, 'optionNumber1')) as P;
      case 'optionNumber2':
        return (IsarNative.jsObjectGet(jsObj, 'optionNumber2')) as P;
      case 'optionTIme2':
        return (IsarNative.jsObjectGet(jsObj, 'optionTIme2') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'optionTIme2'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'optionText1':
        return (IsarNative.jsObjectGet(jsObj, 'optionText1')) as P;
      case 'optionText2':
        return (IsarNative.jsObjectGet(jsObj, 'optionText2')) as P;
      case 'optionTime1':
        return (IsarNative.jsObjectGet(jsObj, 'optionTime1') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'optionTime1'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'readableFlg':
        return (IsarNative.jsObjectGet(jsObj, 'readableFlg')) as P;
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
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Master object) {}
}

class _MasterNativeAdapter extends IsarNativeTypeAdapter<Master> {
  const _MasterNativeAdapter();

  @override
  void serialize(IsarCollection<Master> collection, IsarRawObject rawObj,
      Master object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.code;
    final _code = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_code.length) as int;
    final value1 = object.deleteFlg;
    final _deleteFlg = value1;
    final value2 = object.fileNameSuffix1;
    final _fileNameSuffix1 = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_fileNameSuffix1.length) as int;
    final value3 = object.fileNameSuffix2;
    final _fileNameSuffix2 = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_fileNameSuffix2.length) as int;
    final value4 = object.insertProgramId;
    IsarUint8List? _insertProgramId;
    if (value4 != null) {
      _insertProgramId = IsarBinaryWriter.utf8Encoder.convert(value4);
    }
    dynamicSize += (_insertProgramId?.length ?? 0) as int;
    final value5 = object.insertTime;
    final _insertTime = value5;
    final value6 = object.insertUserDocId;
    IsarUint8List? _insertUserDocId;
    if (value6 != null) {
      _insertUserDocId = IsarBinaryWriter.utf8Encoder.convert(value6);
    }
    dynamicSize += (_insertUserDocId?.length ?? 0) as int;
    final value7 = object.masterDocId;
    final _masterDocId = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_masterDocId.length) as int;
    final value8 = object.masterGroupCode;
    final _masterGroupCode = IsarBinaryWriter.utf8Encoder.convert(value8);
    dynamicSize += (_masterGroupCode.length) as int;
    final value9 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value9);
    dynamicSize += (_name.length) as int;
    final value10 = object.onMemoryFlg;
    final _onMemoryFlg = value10;
    final value11 = object.optionBool1;
    final _optionBool1 = value11;
    final value12 = object.optionBool2;
    final _optionBool2 = value12;
    final value13 = object.optionFile1;
    dynamicSize += (value13?.length ?? 0) * 1;
    final _optionFile1 = value13;
    final value14 = object.optionFile2;
    dynamicSize += (value14?.length ?? 0) * 1;
    final _optionFile2 = value14;
    final value15 = object.optionNumber1;
    final _optionNumber1 = value15;
    final value16 = object.optionNumber2;
    final _optionNumber2 = value16;
    final value17 = object.optionTIme2;
    final _optionTIme2 = value17;
    final value18 = object.optionText1;
    IsarUint8List? _optionText1;
    if (value18 != null) {
      _optionText1 = IsarBinaryWriter.utf8Encoder.convert(value18);
    }
    dynamicSize += (_optionText1?.length ?? 0) as int;
    final value19 = object.optionText2;
    IsarUint8List? _optionText2;
    if (value19 != null) {
      _optionText2 = IsarBinaryWriter.utf8Encoder.convert(value19);
    }
    dynamicSize += (_optionText2?.length ?? 0) as int;
    final value20 = object.optionTime1;
    final _optionTime1 = value20;
    final value21 = object.readableFlg;
    final _readableFlg = value21;
    final value22 = object.updateProgramId;
    IsarUint8List? _updateProgramId;
    if (value22 != null) {
      _updateProgramId = IsarBinaryWriter.utf8Encoder.convert(value22);
    }
    dynamicSize += (_updateProgramId?.length ?? 0) as int;
    final value23 = object.updateTime;
    final _updateTime = value23;
    final value24 = object.updateUserDocId;
    IsarUint8List? _updateUserDocId;
    if (value24 != null) {
      _updateUserDocId = IsarBinaryWriter.utf8Encoder.convert(value24);
    }
    dynamicSize += (_updateUserDocId?.length ?? 0) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _code);
    writer.writeBool(offsets[1], _deleteFlg);
    writer.writeBytes(offsets[2], _fileNameSuffix1);
    writer.writeBytes(offsets[3], _fileNameSuffix2);
    writer.writeBytes(offsets[4], _insertProgramId);
    writer.writeDateTime(offsets[5], _insertTime);
    writer.writeBytes(offsets[6], _insertUserDocId);
    writer.writeBytes(offsets[7], _masterDocId);
    writer.writeBytes(offsets[8], _masterGroupCode);
    writer.writeBytes(offsets[9], _name);
    writer.writeBool(offsets[10], _onMemoryFlg);
    writer.writeBool(offsets[11], _optionBool1);
    writer.writeBool(offsets[12], _optionBool2);
    writer.writeBytes(offsets[13], _optionFile1);
    writer.writeBytes(offsets[14], _optionFile2);
    writer.writeLong(offsets[15], _optionNumber1);
    writer.writeLong(offsets[16], _optionNumber2);
    writer.writeDateTime(offsets[17], _optionTIme2);
    writer.writeBytes(offsets[18], _optionText1);
    writer.writeBytes(offsets[19], _optionText2);
    writer.writeDateTime(offsets[20], _optionTime1);
    writer.writeBool(offsets[21], _readableFlg);
    writer.writeBytes(offsets[22], _updateProgramId);
    writer.writeDateTime(offsets[23], _updateTime);
    writer.writeBytes(offsets[24], _updateUserDocId);
  }

  @override
  Master deserialize(IsarCollection<Master> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Master(
      reader.readString(offsets[7]),
      reader.readString(offsets[8]),
      reader.readString(offsets[0]),
      reader.readString(offsets[9]),
      reader.readBool(offsets[10]),
      reader.readDateTimeOrNull(offsets[20]),
      reader.readDateTimeOrNull(offsets[17]),
      reader.readLongOrNull(offsets[15]),
      reader.readLongOrNull(offsets[16]),
      reader.readStringOrNull(offsets[18]),
      reader.readStringOrNull(offsets[19]),
      reader.readBoolOrNull(offsets[11]),
      reader.readBoolOrNull(offsets[12]),
      reader.readBytesOrNull(offsets[13]),
      reader.readBytesOrNull(offsets[14]),
      reader.readString(offsets[2]),
      reader.readString(offsets[3]),
      reader.readStringOrNull(offsets[6]),
      reader.readStringOrNull(offsets[4]),
      reader.readDateTimeOrNull(offsets[5]),
      reader.readStringOrNull(offsets[24]),
      reader.readStringOrNull(offsets[22]),
      reader.readDateTimeOrNull(offsets[23]),
      reader.readBoolOrNull(offsets[21]),
      reader.readBoolOrNull(offsets[1]),
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
        return (reader.readBoolOrNull(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readStringOrNull(offset)) as P;
      case 5:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 6:
        return (reader.readStringOrNull(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readString(offset)) as P;
      case 9:
        return (reader.readString(offset)) as P;
      case 10:
        return (reader.readBool(offset)) as P;
      case 11:
        return (reader.readBoolOrNull(offset)) as P;
      case 12:
        return (reader.readBoolOrNull(offset)) as P;
      case 13:
        return (reader.readBytesOrNull(offset)) as P;
      case 14:
        return (reader.readBytesOrNull(offset)) as P;
      case 15:
        return (reader.readLongOrNull(offset)) as P;
      case 16:
        return (reader.readLongOrNull(offset)) as P;
      case 17:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 18:
        return (reader.readStringOrNull(offset)) as P;
      case 19:
        return (reader.readStringOrNull(offset)) as P;
      case 20:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 21:
        return (reader.readBoolOrNull(offset)) as P;
      case 22:
        return (reader.readStringOrNull(offset)) as P;
      case 23:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 24:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Master object) {}
}

extension MasterQueryWhereSort on QueryBuilder<Master, Master, QWhere> {
  QueryBuilder<Master, Master, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension MasterQueryWhere on QueryBuilder<Master, Master, QWhereClause> {
  QueryBuilder<Master, Master, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Master, Master, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Master, Master, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Master, Master, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Master, Master, QAfterWhereClause> idBetween(
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

extension MasterQueryFilter on QueryBuilder<Master, Master, QFilterCondition> {
  QueryBuilder<Master, Master, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'code',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'code',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> deleteFlgIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'deleteFlg',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> deleteFlgEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleteFlg',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileNameSuffix1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition>
      fileNameSuffix1GreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileNameSuffix1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1LessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileNameSuffix1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1Between(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileNameSuffix1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileNameSuffix1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileNameSuffix1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1Contains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileNameSuffix1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileNameSuffix1',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileNameSuffix2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition>
      fileNameSuffix2GreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileNameSuffix2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2LessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileNameSuffix2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2Between(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileNameSuffix2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileNameSuffix2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileNameSuffix2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2Contains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileNameSuffix2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> fileNameSuffix2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileNameSuffix2',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'insertProgramId',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdEqualTo(
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

  QueryBuilder<Master, Master, QAfterFilterCondition>
      insertProgramIdGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdStartsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdEndsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'insertTime',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertTimeGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertTimeLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertTimeBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'insertUserDocId',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdEqualTo(
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

  QueryBuilder<Master, Master, QAfterFilterCondition>
      insertUserDocIdGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdStartsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdEndsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> insertUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'masterDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'masterDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'masterDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'masterDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'masterDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'masterDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'masterDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'masterDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'masterGroupCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition>
      masterGroupCodeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'masterGroupCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'masterGroupCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'masterGroupCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'masterGroupCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'masterGroupCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'masterGroupCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> masterGroupCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'masterGroupCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> nameGreaterThan(
    String value, {
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

  QueryBuilder<Master, Master, QAfterFilterCondition> nameLessThan(
    String value, {
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

  QueryBuilder<Master, Master, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Master, Master, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> onMemoryFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'onMemoryFlg',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionBool1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionBool1',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionBool1EqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionBool1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionBool2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionBool2',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionBool2EqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionBool2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionFile1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionFile1',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionFile2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionFile2',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionNumber1',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber1EqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionNumber1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber1GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'optionNumber1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber1LessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'optionNumber1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber1Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'optionNumber1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionNumber2',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber2EqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionNumber2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber2GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'optionNumber2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber2LessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'optionNumber2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionNumber2Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'optionNumber2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTIme2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionTIme2',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTIme2EqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionTIme2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTIme2GreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'optionTIme2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTIme2LessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'optionTIme2',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTIme2Between(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'optionTIme2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionText1',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionText1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1GreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'optionText1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1LessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'optionText1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'optionText1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'optionText1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'optionText1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1Contains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'optionText1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'optionText1',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionText2',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionText2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2GreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'optionText2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2LessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'optionText2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'optionText2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'optionText2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'optionText2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2Contains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'optionText2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionText2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'optionText2',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTime1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'optionTime1',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTime1EqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'optionTime1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTime1GreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'optionTime1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTime1LessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'optionTime1',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> optionTime1Between(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'optionTime1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> readableFlgIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'readableFlg',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> readableFlgEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readableFlg',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'updateProgramId',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdEqualTo(
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

  QueryBuilder<Master, Master, QAfterFilterCondition>
      updateProgramIdGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdStartsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdEndsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'updateTime',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateTimeGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateTimeLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateTimeBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'updateUserDocId',
      value: null,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdEqualTo(
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

  QueryBuilder<Master, Master, QAfterFilterCondition>
      updateUserDocIdGreaterThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdLessThan(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdBetween(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdStartsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdEndsWith(
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

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Master, Master, QAfterFilterCondition> updateUserDocIdMatches(
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

extension MasterQueryLinks on QueryBuilder<Master, Master, QFilterCondition> {}

extension MasterQueryWhereSortBy on QueryBuilder<Master, Master, QSortBy> {
  QueryBuilder<Master, Master, QAfterSortBy> sortByCode() {
    return addSortByInternal('code', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByCodeDesc() {
    return addSortByInternal('code', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByFileNameSuffix1() {
    return addSortByInternal('fileNameSuffix1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByFileNameSuffix1Desc() {
    return addSortByInternal('fileNameSuffix1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByFileNameSuffix2() {
    return addSortByInternal('fileNameSuffix2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByFileNameSuffix2Desc() {
    return addSortByInternal('fileNameSuffix2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByMasterDocId() {
    return addSortByInternal('masterDocId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByMasterDocIdDesc() {
    return addSortByInternal('masterDocId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByMasterGroupCode() {
    return addSortByInternal('masterGroupCode', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByMasterGroupCodeDesc() {
    return addSortByInternal('masterGroupCode', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOnMemoryFlg() {
    return addSortByInternal('onMemoryFlg', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOnMemoryFlgDesc() {
    return addSortByInternal('onMemoryFlg', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionBool1() {
    return addSortByInternal('optionBool1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionBool1Desc() {
    return addSortByInternal('optionBool1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionBool2() {
    return addSortByInternal('optionBool2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionBool2Desc() {
    return addSortByInternal('optionBool2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionNumber1() {
    return addSortByInternal('optionNumber1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionNumber1Desc() {
    return addSortByInternal('optionNumber1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionNumber2() {
    return addSortByInternal('optionNumber2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionNumber2Desc() {
    return addSortByInternal('optionNumber2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionTIme2() {
    return addSortByInternal('optionTIme2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionTIme2Desc() {
    return addSortByInternal('optionTIme2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionText1() {
    return addSortByInternal('optionText1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionText1Desc() {
    return addSortByInternal('optionText1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionText2() {
    return addSortByInternal('optionText2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionText2Desc() {
    return addSortByInternal('optionText2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionTime1() {
    return addSortByInternal('optionTime1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByOptionTime1Desc() {
    return addSortByInternal('optionTime1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> sortByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }
}

extension MasterQueryWhereSortThenBy
    on QueryBuilder<Master, Master, QSortThenBy> {
  QueryBuilder<Master, Master, QAfterSortBy> thenByCode() {
    return addSortByInternal('code', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByCodeDesc() {
    return addSortByInternal('code', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByFileNameSuffix1() {
    return addSortByInternal('fileNameSuffix1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByFileNameSuffix1Desc() {
    return addSortByInternal('fileNameSuffix1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByFileNameSuffix2() {
    return addSortByInternal('fileNameSuffix2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByFileNameSuffix2Desc() {
    return addSortByInternal('fileNameSuffix2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByMasterDocId() {
    return addSortByInternal('masterDocId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByMasterDocIdDesc() {
    return addSortByInternal('masterDocId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByMasterGroupCode() {
    return addSortByInternal('masterGroupCode', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByMasterGroupCodeDesc() {
    return addSortByInternal('masterGroupCode', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOnMemoryFlg() {
    return addSortByInternal('onMemoryFlg', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOnMemoryFlgDesc() {
    return addSortByInternal('onMemoryFlg', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionBool1() {
    return addSortByInternal('optionBool1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionBool1Desc() {
    return addSortByInternal('optionBool1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionBool2() {
    return addSortByInternal('optionBool2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionBool2Desc() {
    return addSortByInternal('optionBool2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionNumber1() {
    return addSortByInternal('optionNumber1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionNumber1Desc() {
    return addSortByInternal('optionNumber1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionNumber2() {
    return addSortByInternal('optionNumber2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionNumber2Desc() {
    return addSortByInternal('optionNumber2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionTIme2() {
    return addSortByInternal('optionTIme2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionTIme2Desc() {
    return addSortByInternal('optionTIme2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionText1() {
    return addSortByInternal('optionText1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionText1Desc() {
    return addSortByInternal('optionText1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionText2() {
    return addSortByInternal('optionText2', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionText2Desc() {
    return addSortByInternal('optionText2', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionTime1() {
    return addSortByInternal('optionTime1', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByOptionTime1Desc() {
    return addSortByInternal('optionTime1', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Master, Master, QAfterSortBy> thenByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }
}

extension MasterQueryWhereDistinct on QueryBuilder<Master, Master, QDistinct> {
  QueryBuilder<Master, Master, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('code', caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByDeleteFlg() {
    return addDistinctByInternal('deleteFlg');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByFileNameSuffix1(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileNameSuffix1',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByFileNameSuffix2(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileNameSuffix2',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByInsertProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByInsertTime() {
    return addDistinctByInternal('insertTime');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByInsertUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByMasterDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('masterDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByMasterGroupCode(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('masterGroupCode',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOnMemoryFlg() {
    return addDistinctByInternal('onMemoryFlg');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionBool1() {
    return addDistinctByInternal('optionBool1');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionBool2() {
    return addDistinctByInternal('optionBool2');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionNumber1() {
    return addDistinctByInternal('optionNumber1');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionNumber2() {
    return addDistinctByInternal('optionNumber2');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionTIme2() {
    return addDistinctByInternal('optionTIme2');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionText1(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('optionText1', caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionText2(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('optionText2', caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByOptionTime1() {
    return addDistinctByInternal('optionTime1');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByReadableFlg() {
    return addDistinctByInternal('readableFlg');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByUpdateProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Master, Master, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }

  QueryBuilder<Master, Master, QDistinct> distinctByUpdateUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateUserDocId',
        caseSensitive: caseSensitive);
  }
}

extension MasterQueryProperty on QueryBuilder<Master, Master, QQueryProperty> {
  QueryBuilder<Master, String, QQueryOperations> codeProperty() {
    return addPropertyNameInternal('code');
  }

  QueryBuilder<Master, bool?, QQueryOperations> deleteFlgProperty() {
    return addPropertyNameInternal('deleteFlg');
  }

  QueryBuilder<Master, String, QQueryOperations> fileNameSuffix1Property() {
    return addPropertyNameInternal('fileNameSuffix1');
  }

  QueryBuilder<Master, String, QQueryOperations> fileNameSuffix2Property() {
    return addPropertyNameInternal('fileNameSuffix2');
  }

  QueryBuilder<Master, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Master, String?, QQueryOperations> insertProgramIdProperty() {
    return addPropertyNameInternal('insertProgramId');
  }

  QueryBuilder<Master, DateTime?, QQueryOperations> insertTimeProperty() {
    return addPropertyNameInternal('insertTime');
  }

  QueryBuilder<Master, String?, QQueryOperations> insertUserDocIdProperty() {
    return addPropertyNameInternal('insertUserDocId');
  }

  QueryBuilder<Master, String, QQueryOperations> masterDocIdProperty() {
    return addPropertyNameInternal('masterDocId');
  }

  QueryBuilder<Master, String, QQueryOperations> masterGroupCodeProperty() {
    return addPropertyNameInternal('masterGroupCode');
  }

  QueryBuilder<Master, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Master, bool, QQueryOperations> onMemoryFlgProperty() {
    return addPropertyNameInternal('onMemoryFlg');
  }

  QueryBuilder<Master, bool?, QQueryOperations> optionBool1Property() {
    return addPropertyNameInternal('optionBool1');
  }

  QueryBuilder<Master, bool?, QQueryOperations> optionBool2Property() {
    return addPropertyNameInternal('optionBool2');
  }

  QueryBuilder<Master, Uint8List?, QQueryOperations> optionFile1Property() {
    return addPropertyNameInternal('optionFile1');
  }

  QueryBuilder<Master, Uint8List?, QQueryOperations> optionFile2Property() {
    return addPropertyNameInternal('optionFile2');
  }

  QueryBuilder<Master, int?, QQueryOperations> optionNumber1Property() {
    return addPropertyNameInternal('optionNumber1');
  }

  QueryBuilder<Master, int?, QQueryOperations> optionNumber2Property() {
    return addPropertyNameInternal('optionNumber2');
  }

  QueryBuilder<Master, DateTime?, QQueryOperations> optionTIme2Property() {
    return addPropertyNameInternal('optionTIme2');
  }

  QueryBuilder<Master, String?, QQueryOperations> optionText1Property() {
    return addPropertyNameInternal('optionText1');
  }

  QueryBuilder<Master, String?, QQueryOperations> optionText2Property() {
    return addPropertyNameInternal('optionText2');
  }

  QueryBuilder<Master, DateTime?, QQueryOperations> optionTime1Property() {
    return addPropertyNameInternal('optionTime1');
  }

  QueryBuilder<Master, bool?, QQueryOperations> readableFlgProperty() {
    return addPropertyNameInternal('readableFlg');
  }

  QueryBuilder<Master, String?, QQueryOperations> updateProgramIdProperty() {
    return addPropertyNameInternal('updateProgramId');
  }

  QueryBuilder<Master, DateTime?, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }

  QueryBuilder<Master, String?, QQueryOperations> updateUserDocIdProperty() {
    return addPropertyNameInternal('updateUserDocId');
  }
}
