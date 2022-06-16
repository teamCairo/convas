// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetEventCollection on Isar {
  IsarCollection<Event> get events {
    return getCollection('Event');
  }
}

final EventSchema = CollectionSchema(
  name: 'Event',
  schema:
      '{"name":"Event","idName":"id","properties":[{"name":"callChannelId","type":"String"},{"name":"deleteFlg","type":"Bool"},{"name":"description","type":"String"},{"name":"eventDocId","type":"String"},{"name":"eventName","type":"String"},{"name":"eventType","type":"String"},{"name":"friday","type":"Bool"},{"name":"friendUserDocId","type":"String"},{"name":"fromTime","type":"Long"},{"name":"insertProgramId","type":"String"},{"name":"insertTime","type":"Long"},{"name":"insertUserDocId","type":"String"},{"name":"isAllDay","type":"Bool"},{"name":"monday","type":"Bool"},{"name":"readableFlg","type":"Bool"},{"name":"recurrenceRule","type":"String"},{"name":"repeat","type":"Bool"},{"name":"saturday","type":"Bool"},{"name":"sunday","type":"Bool"},{"name":"thursday","type":"Bool"},{"name":"toTime","type":"Long"},{"name":"tuesday","type":"Bool"},{"name":"updateProgramId","type":"String"},{"name":"updateTime","type":"Long"},{"name":"updateUserDocId","type":"String"},{"name":"userDocId","type":"String"},{"name":"wednesday","type":"Bool"}],"indexes":[],"links":[]}',
  nativeAdapter: const _EventNativeAdapter(),
  webAdapter: const _EventWebAdapter(),
  idName: 'id',
  propertyIds: {
    'callChannelId': 0,
    'deleteFlg': 1,
    'description': 2,
    'eventDocId': 3,
    'eventName': 4,
    'eventType': 5,
    'friday': 6,
    'friendUserDocId': 7,
    'fromTime': 8,
    'insertProgramId': 9,
    'insertTime': 10,
    'insertUserDocId': 11,
    'isAllDay': 12,
    'monday': 13,
    'readableFlg': 14,
    'recurrenceRule': 15,
    'repeat': 16,
    'saturday': 17,
    'sunday': 18,
    'thursday': 19,
    'toTime': 20,
    'tuesday': 21,
    'updateProgramId': 22,
    'updateTime': 23,
    'updateUserDocId': 24,
    'userDocId': 25,
    'wednesday': 26
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

class _EventWebAdapter extends IsarWebTypeAdapter<Event> {
  const _EventWebAdapter();

  @override
  Object serialize(IsarCollection<Event> collection, Event object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'callChannelId', object.callChannelId);
    IsarNative.jsObjectSet(jsObj, 'deleteFlg', object.deleteFlg);
    IsarNative.jsObjectSet(jsObj, 'description', object.description);
    IsarNative.jsObjectSet(jsObj, 'eventDocId', object.eventDocId);
    IsarNative.jsObjectSet(jsObj, 'eventName', object.eventName);
    IsarNative.jsObjectSet(jsObj, 'eventType', object.eventType);
    IsarNative.jsObjectSet(jsObj, 'friday', object.friday);
    IsarNative.jsObjectSet(jsObj, 'friendUserDocId', object.friendUserDocId);
    IsarNative.jsObjectSet(
        jsObj, 'fromTime', object.fromTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'insertProgramId', object.insertProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'insertTime', object.insertTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'insertUserDocId', object.insertUserDocId);
    IsarNative.jsObjectSet(jsObj, 'isAllDay', object.isAllDay);
    IsarNative.jsObjectSet(jsObj, 'monday', object.monday);
    IsarNative.jsObjectSet(jsObj, 'readableFlg', object.readableFlg);
    IsarNative.jsObjectSet(jsObj, 'recurrenceRule', object.recurrenceRule);
    IsarNative.jsObjectSet(jsObj, 'repeat', object.repeat);
    IsarNative.jsObjectSet(jsObj, 'saturday', object.saturday);
    IsarNative.jsObjectSet(jsObj, 'sunday', object.sunday);
    IsarNative.jsObjectSet(jsObj, 'thursday', object.thursday);
    IsarNative.jsObjectSet(
        jsObj, 'toTime', object.toTime?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'tuesday', object.tuesday);
    IsarNative.jsObjectSet(jsObj, 'updateProgramId', object.updateProgramId);
    IsarNative.jsObjectSet(
        jsObj, 'updateTime', object.updateTime.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'updateUserDocId', object.updateUserDocId);
    IsarNative.jsObjectSet(jsObj, 'userDocId', object.userDocId);
    IsarNative.jsObjectSet(jsObj, 'wednesday', object.wednesday);
    return jsObj;
  }

  @override
  Event deserialize(IsarCollection<Event> collection, dynamic jsObj) {
    final object = Event(
      IsarNative.jsObjectGet(jsObj, 'eventDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'userDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'eventName') ?? '',
      IsarNative.jsObjectGet(jsObj, 'eventType') ?? '',
      IsarNative.jsObjectGet(jsObj, 'friendUserDocId') ?? '',
      IsarNative.jsObjectGet(jsObj, 'callChannelId'),
      IsarNative.jsObjectGet(jsObj, 'fromTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'fromTime'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'toTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'toTime'),
                  isUtc: true)
              .toLocal()
          : null,
      IsarNative.jsObjectGet(jsObj, 'isAllDay') ?? false,
      IsarNative.jsObjectGet(jsObj, 'repeat') ?? false,
      IsarNative.jsObjectGet(jsObj, 'monday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'tuesday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'wednesday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'thursday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'friday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'saturday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'sunday') ?? false,
      IsarNative.jsObjectGet(jsObj, 'description') ?? '',
      IsarNative.jsObjectGet(jsObj, 'recurrenceRule') ?? '',
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
      case 'callChannelId':
        return (IsarNative.jsObjectGet(jsObj, 'callChannelId')) as P;
      case 'deleteFlg':
        return (IsarNative.jsObjectGet(jsObj, 'deleteFlg') ?? false) as P;
      case 'description':
        return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
      case 'eventDocId':
        return (IsarNative.jsObjectGet(jsObj, 'eventDocId') ?? '') as P;
      case 'eventName':
        return (IsarNative.jsObjectGet(jsObj, 'eventName') ?? '') as P;
      case 'eventType':
        return (IsarNative.jsObjectGet(jsObj, 'eventType') ?? '') as P;
      case 'friday':
        return (IsarNative.jsObjectGet(jsObj, 'friday') ?? false) as P;
      case 'friendUserDocId':
        return (IsarNative.jsObjectGet(jsObj, 'friendUserDocId') ?? '') as P;
      case 'fromTime':
        return (IsarNative.jsObjectGet(jsObj, 'fromTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'fromTime'),
                    isUtc: true)
                .toLocal()
            : null) as P;
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
      case 'isAllDay':
        return (IsarNative.jsObjectGet(jsObj, 'isAllDay') ?? false) as P;
      case 'monday':
        return (IsarNative.jsObjectGet(jsObj, 'monday') ?? false) as P;
      case 'readableFlg':
        return (IsarNative.jsObjectGet(jsObj, 'readableFlg') ?? false) as P;
      case 'recurrenceRule':
        return (IsarNative.jsObjectGet(jsObj, 'recurrenceRule') ?? '') as P;
      case 'repeat':
        return (IsarNative.jsObjectGet(jsObj, 'repeat') ?? false) as P;
      case 'saturday':
        return (IsarNative.jsObjectGet(jsObj, 'saturday') ?? false) as P;
      case 'sunday':
        return (IsarNative.jsObjectGet(jsObj, 'sunday') ?? false) as P;
      case 'thursday':
        return (IsarNative.jsObjectGet(jsObj, 'thursday') ?? false) as P;
      case 'toTime':
        return (IsarNative.jsObjectGet(jsObj, 'toTime') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'toTime'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'tuesday':
        return (IsarNative.jsObjectGet(jsObj, 'tuesday') ?? false) as P;
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
      case 'wednesday':
        return (IsarNative.jsObjectGet(jsObj, 'wednesday') ?? false) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Event object) {}
}

class _EventNativeAdapter extends IsarNativeTypeAdapter<Event> {
  const _EventNativeAdapter();

  @override
  void serialize(IsarCollection<Event> collection, IsarRawObject rawObj,
      Event object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.callChannelId;
    IsarUint8List? _callChannelId;
    if (value0 != null) {
      _callChannelId = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_callChannelId?.length ?? 0) as int;
    final value1 = object.deleteFlg;
    final _deleteFlg = value1;
    final value2 = object.description;
    final _description = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_description.length) as int;
    final value3 = object.eventDocId;
    final _eventDocId = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_eventDocId.length) as int;
    final value4 = object.eventName;
    final _eventName = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_eventName.length) as int;
    final value5 = object.eventType;
    final _eventType = IsarBinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += (_eventType.length) as int;
    final value6 = object.friday;
    final _friday = value6;
    final value7 = object.friendUserDocId;
    final _friendUserDocId = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_friendUserDocId.length) as int;
    final value8 = object.fromTime;
    final _fromTime = value8;
    final value9 = object.insertProgramId;
    final _insertProgramId = IsarBinaryWriter.utf8Encoder.convert(value9);
    dynamicSize += (_insertProgramId.length) as int;
    final value10 = object.insertTime;
    final _insertTime = value10;
    final value11 = object.insertUserDocId;
    final _insertUserDocId = IsarBinaryWriter.utf8Encoder.convert(value11);
    dynamicSize += (_insertUserDocId.length) as int;
    final value12 = object.isAllDay;
    final _isAllDay = value12;
    final value13 = object.monday;
    final _monday = value13;
    final value14 = object.readableFlg;
    final _readableFlg = value14;
    final value15 = object.recurrenceRule;
    final _recurrenceRule = IsarBinaryWriter.utf8Encoder.convert(value15);
    dynamicSize += (_recurrenceRule.length) as int;
    final value16 = object.repeat;
    final _repeat = value16;
    final value17 = object.saturday;
    final _saturday = value17;
    final value18 = object.sunday;
    final _sunday = value18;
    final value19 = object.thursday;
    final _thursday = value19;
    final value20 = object.toTime;
    final _toTime = value20;
    final value21 = object.tuesday;
    final _tuesday = value21;
    final value22 = object.updateProgramId;
    final _updateProgramId = IsarBinaryWriter.utf8Encoder.convert(value22);
    dynamicSize += (_updateProgramId.length) as int;
    final value23 = object.updateTime;
    final _updateTime = value23;
    final value24 = object.updateUserDocId;
    final _updateUserDocId = IsarBinaryWriter.utf8Encoder.convert(value24);
    dynamicSize += (_updateUserDocId.length) as int;
    final value25 = object.userDocId;
    final _userDocId = IsarBinaryWriter.utf8Encoder.convert(value25);
    dynamicSize += (_userDocId.length) as int;
    final value26 = object.wednesday;
    final _wednesday = value26;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _callChannelId);
    writer.writeBool(offsets[1], _deleteFlg);
    writer.writeBytes(offsets[2], _description);
    writer.writeBytes(offsets[3], _eventDocId);
    writer.writeBytes(offsets[4], _eventName);
    writer.writeBytes(offsets[5], _eventType);
    writer.writeBool(offsets[6], _friday);
    writer.writeBytes(offsets[7], _friendUserDocId);
    writer.writeDateTime(offsets[8], _fromTime);
    writer.writeBytes(offsets[9], _insertProgramId);
    writer.writeDateTime(offsets[10], _insertTime);
    writer.writeBytes(offsets[11], _insertUserDocId);
    writer.writeBool(offsets[12], _isAllDay);
    writer.writeBool(offsets[13], _monday);
    writer.writeBool(offsets[14], _readableFlg);
    writer.writeBytes(offsets[15], _recurrenceRule);
    writer.writeBool(offsets[16], _repeat);
    writer.writeBool(offsets[17], _saturday);
    writer.writeBool(offsets[18], _sunday);
    writer.writeBool(offsets[19], _thursday);
    writer.writeDateTime(offsets[20], _toTime);
    writer.writeBool(offsets[21], _tuesday);
    writer.writeBytes(offsets[22], _updateProgramId);
    writer.writeDateTime(offsets[23], _updateTime);
    writer.writeBytes(offsets[24], _updateUserDocId);
    writer.writeBytes(offsets[25], _userDocId);
    writer.writeBool(offsets[26], _wednesday);
  }

  @override
  Event deserialize(IsarCollection<Event> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Event(
      reader.readString(offsets[3]),
      reader.readString(offsets[25]),
      reader.readString(offsets[4]),
      reader.readString(offsets[5]),
      reader.readString(offsets[7]),
      reader.readStringOrNull(offsets[0]),
      reader.readDateTimeOrNull(offsets[8]),
      reader.readDateTimeOrNull(offsets[20]),
      reader.readBool(offsets[12]),
      reader.readBool(offsets[16]),
      reader.readBool(offsets[13]),
      reader.readBool(offsets[21]),
      reader.readBool(offsets[26]),
      reader.readBool(offsets[19]),
      reader.readBool(offsets[6]),
      reader.readBool(offsets[17]),
      reader.readBool(offsets[18]),
      reader.readString(offsets[2]),
      reader.readString(offsets[15]),
      reader.readString(offsets[11]),
      reader.readString(offsets[9]),
      reader.readDateTime(offsets[10]),
      reader.readString(offsets[24]),
      reader.readString(offsets[22]),
      reader.readDateTime(offsets[23]),
      reader.readBool(offsets[14]),
      reader.readBool(offsets[1]),
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
        return (reader.readStringOrNull(offset)) as P;
      case 1:
        return (reader.readBool(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readBool(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 9:
        return (reader.readString(offset)) as P;
      case 10:
        return (reader.readDateTime(offset)) as P;
      case 11:
        return (reader.readString(offset)) as P;
      case 12:
        return (reader.readBool(offset)) as P;
      case 13:
        return (reader.readBool(offset)) as P;
      case 14:
        return (reader.readBool(offset)) as P;
      case 15:
        return (reader.readString(offset)) as P;
      case 16:
        return (reader.readBool(offset)) as P;
      case 17:
        return (reader.readBool(offset)) as P;
      case 18:
        return (reader.readBool(offset)) as P;
      case 19:
        return (reader.readBool(offset)) as P;
      case 20:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 21:
        return (reader.readBool(offset)) as P;
      case 22:
        return (reader.readString(offset)) as P;
      case 23:
        return (reader.readDateTime(offset)) as P;
      case 24:
        return (reader.readString(offset)) as P;
      case 25:
        return (reader.readString(offset)) as P;
      case 26:
        return (reader.readBool(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Event object) {}
}

extension EventQueryWhereSort on QueryBuilder<Event, Event, QWhere> {
  QueryBuilder<Event, Event, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension EventQueryWhere on QueryBuilder<Event, Event, QWhereClause> {
  QueryBuilder<Event, Event, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Event, Event, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idBetween(
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

extension EventQueryFilter on QueryBuilder<Event, Event, QFilterCondition> {
  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'callChannelId',
      value: null,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'callChannelId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'callChannelId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'callChannelId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'callChannelId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'callChannelId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'callChannelId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'callChannelId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> callChannelIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'callChannelId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> deleteFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleteFlg',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
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

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionLessThan(
    String value, {
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

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'eventDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'eventDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'eventDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'eventDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'eventDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'eventDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'eventDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'eventDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'eventName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'eventName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'eventName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'eventName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'eventName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'eventName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'eventName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'eventName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'eventType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'eventType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'eventType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'eventType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'eventType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'eventType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'eventType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'eventType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> fridayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'friday',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'friendUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'friendUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'friendUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'friendUserDocId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'friendUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'friendUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'friendUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> friendUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'friendUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> fromTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fromTime',
      value: null,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> fromTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fromTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> fromTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fromTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> fromTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fromTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> fromTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fromTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> insertProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> insertTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'insertTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> insertTimeGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertTimeLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertTimeBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'insertUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> insertUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'insertUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> isAllDayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isAllDay',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> mondayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'monday',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> readableFlgEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readableFlg',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'recurrenceRule',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'recurrenceRule',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'recurrenceRule',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'recurrenceRule',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'recurrenceRule',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'recurrenceRule',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'recurrenceRule',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> recurrenceRuleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'recurrenceRule',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'repeat',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> saturdayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'saturday',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> sundayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sunday',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> thursdayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'thursday',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> toTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'toTime',
      value: null,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> toTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'toTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> toTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'toTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> toTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'toTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> toTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'toTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> tuesdayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tuesday',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateProgramId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> updateProgramIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateProgramId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> updateTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> updateTimeGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateTimeLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateTimeBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'updateUserDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> updateUserDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'updateUserDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userDocId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> userDocIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userDocId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> wednesdayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'wednesday',
      value: value,
    ));
  }
}

extension EventQueryLinks on QueryBuilder<Event, Event, QFilterCondition> {}

extension EventQueryWhereSortBy on QueryBuilder<Event, Event, QSortBy> {
  QueryBuilder<Event, Event, QAfterSortBy> sortByCallChannelId() {
    return addSortByInternal('callChannelId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByCallChannelIdDesc() {
    return addSortByInternal('callChannelId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventDocId() {
    return addSortByInternal('eventDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventDocIdDesc() {
    return addSortByInternal('eventDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventName() {
    return addSortByInternal('eventName', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventNameDesc() {
    return addSortByInternal('eventName', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventType() {
    return addSortByInternal('eventType', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventTypeDesc() {
    return addSortByInternal('eventType', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByFriday() {
    return addSortByInternal('friday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByFridayDesc() {
    return addSortByInternal('friday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByFriendUserDocId() {
    return addSortByInternal('friendUserDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByFriendUserDocIdDesc() {
    return addSortByInternal('friendUserDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByFromTime() {
    return addSortByInternal('fromTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByFromTimeDesc() {
    return addSortByInternal('fromTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByIsAllDay() {
    return addSortByInternal('isAllDay', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByIsAllDayDesc() {
    return addSortByInternal('isAllDay', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByMonday() {
    return addSortByInternal('monday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByMondayDesc() {
    return addSortByInternal('monday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRecurrenceRule() {
    return addSortByInternal('recurrenceRule', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRecurrenceRuleDesc() {
    return addSortByInternal('recurrenceRule', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRepeat() {
    return addSortByInternal('repeat', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRepeatDesc() {
    return addSortByInternal('repeat', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortBySaturday() {
    return addSortByInternal('saturday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortBySaturdayDesc() {
    return addSortByInternal('saturday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortBySunday() {
    return addSortByInternal('sunday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortBySundayDesc() {
    return addSortByInternal('sunday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByThursday() {
    return addSortByInternal('thursday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByThursdayDesc() {
    return addSortByInternal('thursday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByToTime() {
    return addSortByInternal('toTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByToTimeDesc() {
    return addSortByInternal('toTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByTuesday() {
    return addSortByInternal('tuesday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByTuesdayDesc() {
    return addSortByInternal('tuesday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUserDocId() {
    return addSortByInternal('userDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByUserDocIdDesc() {
    return addSortByInternal('userDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByWednesday() {
    return addSortByInternal('wednesday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByWednesdayDesc() {
    return addSortByInternal('wednesday', Sort.desc);
  }
}

extension EventQueryWhereSortThenBy on QueryBuilder<Event, Event, QSortThenBy> {
  QueryBuilder<Event, Event, QAfterSortBy> thenByCallChannelId() {
    return addSortByInternal('callChannelId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByCallChannelIdDesc() {
    return addSortByInternal('callChannelId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDeleteFlg() {
    return addSortByInternal('deleteFlg', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDeleteFlgDesc() {
    return addSortByInternal('deleteFlg', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventDocId() {
    return addSortByInternal('eventDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventDocIdDesc() {
    return addSortByInternal('eventDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventName() {
    return addSortByInternal('eventName', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventNameDesc() {
    return addSortByInternal('eventName', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventType() {
    return addSortByInternal('eventType', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventTypeDesc() {
    return addSortByInternal('eventType', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByFriday() {
    return addSortByInternal('friday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByFridayDesc() {
    return addSortByInternal('friday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByFriendUserDocId() {
    return addSortByInternal('friendUserDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByFriendUserDocIdDesc() {
    return addSortByInternal('friendUserDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByFromTime() {
    return addSortByInternal('fromTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByFromTimeDesc() {
    return addSortByInternal('fromTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByInsertProgramId() {
    return addSortByInternal('insertProgramId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByInsertProgramIdDesc() {
    return addSortByInternal('insertProgramId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByInsertTime() {
    return addSortByInternal('insertTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByInsertTimeDesc() {
    return addSortByInternal('insertTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByInsertUserDocId() {
    return addSortByInternal('insertUserDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByInsertUserDocIdDesc() {
    return addSortByInternal('insertUserDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByIsAllDay() {
    return addSortByInternal('isAllDay', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByIsAllDayDesc() {
    return addSortByInternal('isAllDay', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByMonday() {
    return addSortByInternal('monday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByMondayDesc() {
    return addSortByInternal('monday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByReadableFlg() {
    return addSortByInternal('readableFlg', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByReadableFlgDesc() {
    return addSortByInternal('readableFlg', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRecurrenceRule() {
    return addSortByInternal('recurrenceRule', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRecurrenceRuleDesc() {
    return addSortByInternal('recurrenceRule', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRepeat() {
    return addSortByInternal('repeat', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRepeatDesc() {
    return addSortByInternal('repeat', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenBySaturday() {
    return addSortByInternal('saturday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenBySaturdayDesc() {
    return addSortByInternal('saturday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenBySunday() {
    return addSortByInternal('sunday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenBySundayDesc() {
    return addSortByInternal('sunday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByThursday() {
    return addSortByInternal('thursday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByThursdayDesc() {
    return addSortByInternal('thursday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByToTime() {
    return addSortByInternal('toTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByToTimeDesc() {
    return addSortByInternal('toTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByTuesday() {
    return addSortByInternal('tuesday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByTuesdayDesc() {
    return addSortByInternal('tuesday', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUpdateProgramId() {
    return addSortByInternal('updateProgramId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUpdateProgramIdDesc() {
    return addSortByInternal('updateProgramId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUpdateUserDocId() {
    return addSortByInternal('updateUserDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUpdateUserDocIdDesc() {
    return addSortByInternal('updateUserDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUserDocId() {
    return addSortByInternal('userDocId', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByUserDocIdDesc() {
    return addSortByInternal('userDocId', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByWednesday() {
    return addSortByInternal('wednesday', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByWednesdayDesc() {
    return addSortByInternal('wednesday', Sort.desc);
  }
}

extension EventQueryWhereDistinct on QueryBuilder<Event, Event, QDistinct> {
  QueryBuilder<Event, Event, QDistinct> distinctByCallChannelId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('callChannelId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByDeleteFlg() {
    return addDistinctByInternal('deleteFlg');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByEventDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('eventDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByEventName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('eventName', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByEventType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('eventType', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByFriday() {
    return addDistinctByInternal('friday');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByFriendUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('friendUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByFromTime() {
    return addDistinctByInternal('fromTime');
  }

  QueryBuilder<Event, Event, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByInsertProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByInsertTime() {
    return addDistinctByInternal('insertTime');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByInsertUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('insertUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByIsAllDay() {
    return addDistinctByInternal('isAllDay');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByMonday() {
    return addDistinctByInternal('monday');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByReadableFlg() {
    return addDistinctByInternal('readableFlg');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByRecurrenceRule(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('recurrenceRule',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByRepeat() {
    return addDistinctByInternal('repeat');
  }

  QueryBuilder<Event, Event, QDistinct> distinctBySaturday() {
    return addDistinctByInternal('saturday');
  }

  QueryBuilder<Event, Event, QDistinct> distinctBySunday() {
    return addDistinctByInternal('sunday');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByThursday() {
    return addDistinctByInternal('thursday');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByToTime() {
    return addDistinctByInternal('toTime');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByTuesday() {
    return addDistinctByInternal('tuesday');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByUpdateProgramId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateProgramId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByUpdateUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('updateUserDocId',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByUserDocId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userDocId', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByWednesday() {
    return addDistinctByInternal('wednesday');
  }
}

extension EventQueryProperty on QueryBuilder<Event, Event, QQueryProperty> {
  QueryBuilder<Event, String?, QQueryOperations> callChannelIdProperty() {
    return addPropertyNameInternal('callChannelId');
  }

  QueryBuilder<Event, bool, QQueryOperations> deleteFlgProperty() {
    return addPropertyNameInternal('deleteFlg');
  }

  QueryBuilder<Event, String, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Event, String, QQueryOperations> eventDocIdProperty() {
    return addPropertyNameInternal('eventDocId');
  }

  QueryBuilder<Event, String, QQueryOperations> eventNameProperty() {
    return addPropertyNameInternal('eventName');
  }

  QueryBuilder<Event, String, QQueryOperations> eventTypeProperty() {
    return addPropertyNameInternal('eventType');
  }

  QueryBuilder<Event, bool, QQueryOperations> fridayProperty() {
    return addPropertyNameInternal('friday');
  }

  QueryBuilder<Event, String, QQueryOperations> friendUserDocIdProperty() {
    return addPropertyNameInternal('friendUserDocId');
  }

  QueryBuilder<Event, DateTime?, QQueryOperations> fromTimeProperty() {
    return addPropertyNameInternal('fromTime');
  }

  QueryBuilder<Event, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Event, String, QQueryOperations> insertProgramIdProperty() {
    return addPropertyNameInternal('insertProgramId');
  }

  QueryBuilder<Event, DateTime, QQueryOperations> insertTimeProperty() {
    return addPropertyNameInternal('insertTime');
  }

  QueryBuilder<Event, String, QQueryOperations> insertUserDocIdProperty() {
    return addPropertyNameInternal('insertUserDocId');
  }

  QueryBuilder<Event, bool, QQueryOperations> isAllDayProperty() {
    return addPropertyNameInternal('isAllDay');
  }

  QueryBuilder<Event, bool, QQueryOperations> mondayProperty() {
    return addPropertyNameInternal('monday');
  }

  QueryBuilder<Event, bool, QQueryOperations> readableFlgProperty() {
    return addPropertyNameInternal('readableFlg');
  }

  QueryBuilder<Event, String, QQueryOperations> recurrenceRuleProperty() {
    return addPropertyNameInternal('recurrenceRule');
  }

  QueryBuilder<Event, bool, QQueryOperations> repeatProperty() {
    return addPropertyNameInternal('repeat');
  }

  QueryBuilder<Event, bool, QQueryOperations> saturdayProperty() {
    return addPropertyNameInternal('saturday');
  }

  QueryBuilder<Event, bool, QQueryOperations> sundayProperty() {
    return addPropertyNameInternal('sunday');
  }

  QueryBuilder<Event, bool, QQueryOperations> thursdayProperty() {
    return addPropertyNameInternal('thursday');
  }

  QueryBuilder<Event, DateTime?, QQueryOperations> toTimeProperty() {
    return addPropertyNameInternal('toTime');
  }

  QueryBuilder<Event, bool, QQueryOperations> tuesdayProperty() {
    return addPropertyNameInternal('tuesday');
  }

  QueryBuilder<Event, String, QQueryOperations> updateProgramIdProperty() {
    return addPropertyNameInternal('updateProgramId');
  }

  QueryBuilder<Event, DateTime, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }

  QueryBuilder<Event, String, QQueryOperations> updateUserDocIdProperty() {
    return addPropertyNameInternal('updateUserDocId');
  }

  QueryBuilder<Event, String, QQueryOperations> userDocIdProperty() {
    return addPropertyNameInternal('userDocId');
  }

  QueryBuilder<Event, bool, QQueryOperations> wednesdayProperty() {
    return addPropertyNameInternal('wednesday');
  }
}
