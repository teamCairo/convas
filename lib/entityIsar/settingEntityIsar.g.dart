// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settingEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSettingCollection on Isar {
  IsarCollection<Setting> get settings {
    return getCollection('Setting');
  }
}

final SettingSchema = CollectionSchema(
  name: 'Setting',
  schema:
      '{"name":"Setting","idName":"id","properties":[{"name":"boolValue1","type":"Bool"},{"name":"boolValue2","type":"Bool"},{"name":"dateTimeValue1","type":"Long"},{"name":"dateTimeValue2","type":"Long"},{"name":"numberValue1","type":"Long"},{"name":"numberValue2","type":"Long"},{"name":"settingCode","type":"String"},{"name":"stringValue1","type":"String"},{"name":"stringValue2","type":"String"},{"name":"uint8ListValue1","type":"ByteList"},{"name":"uint8ListValue2","type":"ByteList"}],"indexes":[],"links":[]}',
  nativeAdapter: const _SettingNativeAdapter(),
  webAdapter: const _SettingWebAdapter(),
  idName: 'id',
  propertyIds: {
    'boolValue1': 0,
    'boolValue2': 1,
    'dateTimeValue1': 2,
    'dateTimeValue2': 3,
    'numberValue1': 4,
    'numberValue2': 5,
    'settingCode': 6,
    'stringValue1': 7,
    'stringValue2': 8,
    'uint8ListValue1': 9,
    'uint8ListValue2': 10
  },
  listProperties: {'uint8ListValue1', 'uint8ListValue2'},
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

class _SettingWebAdapter extends IsarWebTypeAdapter<Setting> {
  const _SettingWebAdapter();

  @override
  Object serialize(IsarCollection<Setting> collection, Setting object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'boolValue1', object.boolValue1);
    IsarNative.jsObjectSet(jsObj, 'boolValue2', object.boolValue2);
    IsarNative.jsObjectSet(jsObj, 'dateTimeValue1',
        object.dateTimeValue1?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'dateTimeValue2',
        object.dateTimeValue2?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'numberValue1', object.numberValue1);
    IsarNative.jsObjectSet(jsObj, 'numberValue2', object.numberValue2);
    IsarNative.jsObjectSet(jsObj, 'settingCode', object.settingCode);
    IsarNative.jsObjectSet(jsObj, 'stringValue1', object.stringValue1);
    IsarNative.jsObjectSet(jsObj, 'stringValue2', object.stringValue2);
    IsarNative.jsObjectSet(jsObj, 'uint8ListValue1', object.uint8ListValue1);
    IsarNative.jsObjectSet(jsObj, 'uint8ListValue2', object.uint8ListValue2);
    return jsObj;
  }

  @override
  Setting deserialize(IsarCollection<Setting> collection, dynamic jsObj) {
    final object = Setting(
      IsarNative.jsObjectGet(jsObj, 'settingCode') ?? '',
      IsarNative.jsObjectGet(jsObj, 'stringValue1'),
      IsarNative.jsObjectGet(jsObj, 'stringValue2'),
      IsarNative.jsObjectGet(jsObj, 'numberValue1'),
      IsarNative.jsObjectGet(jsObj, 'numberValue2'),
      IsarNative.jsObjectGet(jsObj, 'dateTimeValue1') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTimeValue1'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'dateTimeValue2') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTimeValue2'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'boolValue1'),
      IsarNative.jsObjectGet(jsObj, 'boolValue2'),
      IsarNative.jsObjectGet(jsObj, 'uint8ListValue1'),
      IsarNative.jsObjectGet(jsObj, 'uint8ListValue2'),
    );
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'boolValue1':
        return (IsarNative.jsObjectGet(jsObj, 'boolValue1')) as P;
      case 'boolValue2':
        return (IsarNative.jsObjectGet(jsObj, 'boolValue2')) as P;
      case 'dateTimeValue1':
        return (IsarNative.jsObjectGet(jsObj, 'dateTimeValue1') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'dateTimeValue1'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'dateTimeValue2':
        return (IsarNative.jsObjectGet(jsObj, 'dateTimeValue2') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'dateTimeValue2'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'numberValue1':
        return (IsarNative.jsObjectGet(jsObj, 'numberValue1')) as P;
      case 'numberValue2':
        return (IsarNative.jsObjectGet(jsObj, 'numberValue2')) as P;
      case 'settingCode':
        return (IsarNative.jsObjectGet(jsObj, 'settingCode') ?? '') as P;
      case 'stringValue1':
        return (IsarNative.jsObjectGet(jsObj, 'stringValue1')) as P;
      case 'stringValue2':
        return (IsarNative.jsObjectGet(jsObj, 'stringValue2')) as P;
      case 'uint8ListValue1':
        return (IsarNative.jsObjectGet(jsObj, 'uint8ListValue1')) as P;
      case 'uint8ListValue2':
        return (IsarNative.jsObjectGet(jsObj, 'uint8ListValue2')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Setting object) {}
}

class _SettingNativeAdapter extends IsarNativeTypeAdapter<Setting> {
  const _SettingNativeAdapter();

  @override
  void serialize(IsarCollection<Setting> collection, IsarRawObject rawObj,
      Setting object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.boolValue1;
    final _boolValue1 = value0;
    final value1 = object.boolValue2;
    final _boolValue2 = value1;
    final value2 = object.dateTimeValue1;
    final _dateTimeValue1 = value2;
    final value3 = object.dateTimeValue2;
    final _dateTimeValue2 = value3;
    final value4 = object.numberValue1;
    final _numberValue1 = value4;
    final value5 = object.numberValue2;
    final _numberValue2 = value5;
    final value6 = object.settingCode;
    final _settingCode = IsarBinaryWriter.utf8Encoder.convert(value6);
    dynamicSize += (_settingCode.length) as int;
    final value7 = object.stringValue1;
    IsarUint8List? _stringValue1;
    if (value7 != null) {
      _stringValue1 = IsarBinaryWriter.utf8Encoder.convert(value7);
    }
    dynamicSize += (_stringValue1?.length ?? 0) as int;
    final value8 = object.stringValue2;
    IsarUint8List? _stringValue2;
    if (value8 != null) {
      _stringValue2 = IsarBinaryWriter.utf8Encoder.convert(value8);
    }
    dynamicSize += (_stringValue2?.length ?? 0) as int;
    final value9 = object.uint8ListValue1;
    dynamicSize += (value9?.length ?? 0) * 1;
    final _uint8ListValue1 = value9;
    final value10 = object.uint8ListValue2;
    dynamicSize += (value10?.length ?? 0) * 1;
    final _uint8ListValue2 = value10;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBool(offsets[0], _boolValue1);
    writer.writeBool(offsets[1], _boolValue2);
    writer.writeDateTime(offsets[2], _dateTimeValue1);
    writer.writeDateTime(offsets[3], _dateTimeValue2);
    writer.writeLong(offsets[4], _numberValue1);
    writer.writeLong(offsets[5], _numberValue2);
    writer.writeBytes(offsets[6], _settingCode);
    writer.writeBytes(offsets[7], _stringValue1);
    writer.writeBytes(offsets[8], _stringValue2);
    writer.writeBytes(offsets[9], _uint8ListValue1);
    writer.writeBytes(offsets[10], _uint8ListValue2);
  }

  @override
  Setting deserialize(IsarCollection<Setting> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Setting(
      reader.readString(offsets[6]),
      reader.readStringOrNull(offsets[7]),
      reader.readStringOrNull(offsets[8]),
      reader.readLongOrNull(offsets[4]),
      reader.readLongOrNull(offsets[5]),
      reader.readDateTimeOrNull(offsets[2]),
      reader.readDateTimeOrNull(offsets[3]),
      reader.readBoolOrNull(offsets[0]),
      reader.readBoolOrNull(offsets[1]),
      reader.readBytesOrNull(offsets[9]),
      reader.readBytesOrNull(offsets[10]),
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
        return (reader.readBoolOrNull(offset)) as P;
      case 1:
        return (reader.readBoolOrNull(offset)) as P;
      case 2:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 3:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 4:
        return (reader.readLongOrNull(offset)) as P;
      case 5:
        return (reader.readLongOrNull(offset)) as P;
      case 6:
        return (reader.readString(offset)) as P;
      case 7:
        return (reader.readStringOrNull(offset)) as P;
      case 8:
        return (reader.readStringOrNull(offset)) as P;
      case 9:
        return (reader.readBytesOrNull(offset)) as P;
      case 10:
        return (reader.readBytesOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Setting object) {}
}

extension SettingQueryWhereSort on QueryBuilder<Setting, Setting, QWhere> {
  QueryBuilder<Setting, Setting, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension SettingQueryWhere on QueryBuilder<Setting, Setting, QWhereClause> {
  QueryBuilder<Setting, Setting, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idBetween(
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

extension SettingQueryFilter
    on QueryBuilder<Setting, Setting, QFilterCondition> {
  QueryBuilder<Setting, Setting, QAfterFilterCondition> boolValue1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'boolValue1',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> boolValue1EqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'boolValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> boolValue2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'boolValue2',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> boolValue2EqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'boolValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'dateTimeValue1',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue1EqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateTimeValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition>
      dateTimeValue1GreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateTimeValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue1LessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateTimeValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue1Between(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateTimeValue1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'dateTimeValue2',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue2EqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateTimeValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition>
      dateTimeValue2GreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateTimeValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue2LessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateTimeValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> dateTimeValue2Between(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateTimeValue2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'numberValue1',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue1EqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'numberValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue1GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'numberValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue1LessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'numberValue1',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue1Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'numberValue1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'numberValue2',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue2EqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'numberValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue2GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'numberValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue2LessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'numberValue2',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> numberValue2Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'numberValue2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'settingCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'settingCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'settingCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'settingCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'settingCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'settingCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'settingCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> settingCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'settingCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringValue1',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringValue1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1GreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'stringValue1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1LessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'stringValue1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'stringValue1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'stringValue1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'stringValue1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1Contains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'stringValue1',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'stringValue1',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringValue2',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringValue2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2GreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'stringValue2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2LessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'stringValue2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2Between(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'stringValue2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'stringValue2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'stringValue2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2Contains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'stringValue2',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> stringValue2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'stringValue2',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition>
      uint8ListValue1IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'uint8ListValue1',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition>
      uint8ListValue2IsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'uint8ListValue2',
      value: null,
    ));
  }
}

extension SettingQueryLinks
    on QueryBuilder<Setting, Setting, QFilterCondition> {}

extension SettingQueryWhereSortBy on QueryBuilder<Setting, Setting, QSortBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> sortByBoolValue1() {
    return addSortByInternal('boolValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByBoolValue1Desc() {
    return addSortByInternal('boolValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByBoolValue2() {
    return addSortByInternal('boolValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByBoolValue2Desc() {
    return addSortByInternal('boolValue2', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByDateTimeValue1() {
    return addSortByInternal('dateTimeValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByDateTimeValue1Desc() {
    return addSortByInternal('dateTimeValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByDateTimeValue2() {
    return addSortByInternal('dateTimeValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByDateTimeValue2Desc() {
    return addSortByInternal('dateTimeValue2', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByNumberValue1() {
    return addSortByInternal('numberValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByNumberValue1Desc() {
    return addSortByInternal('numberValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByNumberValue2() {
    return addSortByInternal('numberValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByNumberValue2Desc() {
    return addSortByInternal('numberValue2', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortBySettingCode() {
    return addSortByInternal('settingCode', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortBySettingCodeDesc() {
    return addSortByInternal('settingCode', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByStringValue1() {
    return addSortByInternal('stringValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByStringValue1Desc() {
    return addSortByInternal('stringValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByStringValue2() {
    return addSortByInternal('stringValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByStringValue2Desc() {
    return addSortByInternal('stringValue2', Sort.desc);
  }
}

extension SettingQueryWhereSortThenBy
    on QueryBuilder<Setting, Setting, QSortThenBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> thenByBoolValue1() {
    return addSortByInternal('boolValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByBoolValue1Desc() {
    return addSortByInternal('boolValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByBoolValue2() {
    return addSortByInternal('boolValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByBoolValue2Desc() {
    return addSortByInternal('boolValue2', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByDateTimeValue1() {
    return addSortByInternal('dateTimeValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByDateTimeValue1Desc() {
    return addSortByInternal('dateTimeValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByDateTimeValue2() {
    return addSortByInternal('dateTimeValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByDateTimeValue2Desc() {
    return addSortByInternal('dateTimeValue2', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByNumberValue1() {
    return addSortByInternal('numberValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByNumberValue1Desc() {
    return addSortByInternal('numberValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByNumberValue2() {
    return addSortByInternal('numberValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByNumberValue2Desc() {
    return addSortByInternal('numberValue2', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenBySettingCode() {
    return addSortByInternal('settingCode', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenBySettingCodeDesc() {
    return addSortByInternal('settingCode', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByStringValue1() {
    return addSortByInternal('stringValue1', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByStringValue1Desc() {
    return addSortByInternal('stringValue1', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByStringValue2() {
    return addSortByInternal('stringValue2', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByStringValue2Desc() {
    return addSortByInternal('stringValue2', Sort.desc);
  }
}

extension SettingQueryWhereDistinct
    on QueryBuilder<Setting, Setting, QDistinct> {
  QueryBuilder<Setting, Setting, QDistinct> distinctByBoolValue1() {
    return addDistinctByInternal('boolValue1');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByBoolValue2() {
    return addDistinctByInternal('boolValue2');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByDateTimeValue1() {
    return addDistinctByInternal('dateTimeValue1');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByDateTimeValue2() {
    return addDistinctByInternal('dateTimeValue2');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByNumberValue1() {
    return addDistinctByInternal('numberValue1');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByNumberValue2() {
    return addDistinctByInternal('numberValue2');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctBySettingCode(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('settingCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByStringValue1(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('stringValue1', caseSensitive: caseSensitive);
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByStringValue2(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('stringValue2', caseSensitive: caseSensitive);
  }
}

extension SettingQueryProperty
    on QueryBuilder<Setting, Setting, QQueryProperty> {
  QueryBuilder<Setting, bool?, QQueryOperations> boolValue1Property() {
    return addPropertyNameInternal('boolValue1');
  }

  QueryBuilder<Setting, bool?, QQueryOperations> boolValue2Property() {
    return addPropertyNameInternal('boolValue2');
  }

  QueryBuilder<Setting, DateTime?, QQueryOperations> dateTimeValue1Property() {
    return addPropertyNameInternal('dateTimeValue1');
  }

  QueryBuilder<Setting, DateTime?, QQueryOperations> dateTimeValue2Property() {
    return addPropertyNameInternal('dateTimeValue2');
  }

  QueryBuilder<Setting, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Setting, int?, QQueryOperations> numberValue1Property() {
    return addPropertyNameInternal('numberValue1');
  }

  QueryBuilder<Setting, int?, QQueryOperations> numberValue2Property() {
    return addPropertyNameInternal('numberValue2');
  }

  QueryBuilder<Setting, String, QQueryOperations> settingCodeProperty() {
    return addPropertyNameInternal('settingCode');
  }

  QueryBuilder<Setting, String?, QQueryOperations> stringValue1Property() {
    return addPropertyNameInternal('stringValue1');
  }

  QueryBuilder<Setting, String?, QQueryOperations> stringValue2Property() {
    return addPropertyNameInternal('stringValue2');
  }

  QueryBuilder<Setting, Uint8List?, QQueryOperations>
      uint8ListValue1Property() {
    return addPropertyNameInternal('uint8ListValue1');
  }

  QueryBuilder<Setting, Uint8List?, QQueryOperations>
      uint8ListValue2Property() {
    return addPropertyNameInternal('uint8ListValue2');
  }
}
