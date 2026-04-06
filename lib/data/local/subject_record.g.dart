// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubjectRecordCollection on Isar {
  IsarCollection<SubjectRecord> get subjectRecords => this.collection();
}

const SubjectRecordSchema = CollectionSchema(
  name: r'SubjectRecord',
  id: -8963205568989952575,
  properties: {
    r'caseId': PropertySchema(id: 0, name: r'caseId', type: IsarType.string),
    r'county': PropertySchema(id: 1, name: r'county', type: IsarType.string),
    r'geoJson': PropertySchema(id: 2, name: r'geoJson', type: IsarType.string),
    r'isActive': PropertySchema(id: 3, name: r'isActive', type: IsarType.bool),
    r'isPhotoEncrypted': PropertySchema(
      id: 4,
      name: r'isPhotoEncrypted',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 5,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'markerType': PropertySchema(
      id: 6,
      name: r'markerType',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 7, name: r'name', type: IsarType.string),
    r'photoBase64': PropertySchema(
      id: 8,
      name: r'photoBase64',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 9,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'state': PropertySchema(id: 10, name: r'state', type: IsarType.string),
  },

  estimateSize: _subjectRecordEstimateSize,
  serialize: _subjectRecordSerialize,
  deserialize: _subjectRecordDeserialize,
  deserializeProp: _subjectRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'state': IndexSchema(
      id: 7917036384617311412,
      name: r'state',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'state',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'county': IndexSchema(
      id: 3055772862192198528,
      name: r'county',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'county',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'caseId': IndexSchema(
      id: 7316275356094004476,
      name: r'caseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'caseId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'isActive': IndexSchema(
      id: 8092228061260947457,
      name: r'isActive',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isActive',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'markerType': IndexSchema(
      id: -436838648463439058,
      name: r'markerType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'markerType',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _subjectRecordGetId,
  getLinks: _subjectRecordGetLinks,
  attach: _subjectRecordAttach,
  version: '3.3.2',
);

int _subjectRecordEstimateSize(
  SubjectRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.caseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.county;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.geoJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.markerType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoBase64;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.state;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _subjectRecordSerialize(
  SubjectRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.caseId);
  writer.writeString(offsets[1], object.county);
  writer.writeString(offsets[2], object.geoJson);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isPhotoEncrypted);
  writer.writeDateTime(offsets[5], object.lastUpdated);
  writer.writeString(offsets[6], object.markerType);
  writer.writeString(offsets[7], object.name);
  writer.writeString(offsets[8], object.photoBase64);
  writer.writeString(offsets[9], object.photoPath);
  writer.writeString(offsets[10], object.state);
}

SubjectRecord _subjectRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubjectRecord();
  object.caseId = reader.readStringOrNull(offsets[0]);
  object.county = reader.readStringOrNull(offsets[1]);
  object.geoJson = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.isPhotoEncrypted = reader.readBool(offsets[4]);
  object.lastUpdated = reader.readDateTimeOrNull(offsets[5]);
  object.markerType = reader.readStringOrNull(offsets[6]);
  object.name = reader.readStringOrNull(offsets[7]);
  object.photoBase64 = reader.readStringOrNull(offsets[8]);
  object.photoPath = reader.readStringOrNull(offsets[9]);
  object.state = reader.readStringOrNull(offsets[10]);
  return object;
}

P _subjectRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _subjectRecordGetId(SubjectRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subjectRecordGetLinks(SubjectRecord object) {
  return [];
}

void _subjectRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  SubjectRecord object,
) {
  object.id = id;
}

extension SubjectRecordQueryWhereSort
    on QueryBuilder<SubjectRecord, SubjectRecord, QWhere> {
  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhere> anyState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'state'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhere> anyCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'county'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhere> anyIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActive'),
      );
    });
  }
}

extension SubjectRecordQueryWhere
    on QueryBuilder<SubjectRecord, SubjectRecord, QWhereClause> {
  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'state', value: [null]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'state',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateEqualTo(
    String? state,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'state', value: [state]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateNotEqualTo(
    String? state,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'state',
                lower: [],
                upper: [state],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'state',
                lower: [state],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'state',
                lower: [state],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'state',
                lower: [],
                upper: [state],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  stateGreaterThan(String? state, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'state',
          lower: [state],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateLessThan(
    String? state, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'state',
          lower: [],
          upper: [state],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateBetween(
    String? lowerState,
    String? upperState, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'state',
          lower: [lowerState],
          includeLower: includeLower,
          upper: [upperState],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateStartsWith(
    String StatePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'state',
          lower: [StatePrefix],
          upper: ['$StatePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'state', value: ['']),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'state', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'state', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'state', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'state', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> countyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'county', value: [null]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  countyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'county',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> countyEqualTo(
    String? county,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'county', value: [county]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  countyNotEqualTo(String? county) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'county',
                lower: [],
                upper: [county],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'county',
                lower: [county],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'county',
                lower: [county],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'county',
                lower: [],
                upper: [county],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  countyGreaterThan(String? county, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'county',
          lower: [county],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> countyLessThan(
    String? county, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'county',
          lower: [],
          upper: [county],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> countyBetween(
    String? lowerCounty,
    String? upperCounty, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'county',
          lower: [lowerCounty],
          includeLower: includeLower,
          upper: [upperCounty],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  countyStartsWith(String CountyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'county',
          lower: [CountyPrefix],
          upper: ['$CountyPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  countyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'county', value: ['']),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  countyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'county', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'county', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'county', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'county', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> caseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'caseId', value: [null]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  caseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'caseId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> caseIdEqualTo(
    String? caseId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'caseId', value: [caseId]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  caseIdNotEqualTo(String? caseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'caseId',
                lower: [],
                upper: [caseId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'caseId',
                lower: [caseId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'caseId',
                lower: [caseId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'caseId',
                lower: [],
                upper: [caseId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause> isActiveEqualTo(
    bool isActive,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isActive', value: [isActive]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  isActiveNotEqualTo(bool isActive) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [],
                upper: [isActive],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [isActive],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [isActive],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [],
                upper: [isActive],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  markerTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'markerType', value: [null]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  markerTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'markerType',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  markerTypeEqualTo(String? markerType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'markerType', value: [markerType]),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterWhereClause>
  markerTypeNotEqualTo(String? markerType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'markerType',
                lower: [],
                upper: [markerType],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'markerType',
                lower: [markerType],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'markerType',
                lower: [markerType],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'markerType',
                lower: [],
                upper: [markerType],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension SubjectRecordQueryFilter
    on QueryBuilder<SubjectRecord, SubjectRecord, QFilterCondition> {
  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'caseId'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'caseId'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'caseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'caseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'caseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'caseId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'caseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'caseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'caseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'caseId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'caseId', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  caseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'caseId', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'county'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'county'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'county',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'county',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'county',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'county',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'county',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'county',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'county',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'county',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'county', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  countyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'county', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'geoJson'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'geoJson'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'geoJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'geoJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'geoJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'geoJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'geoJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'geoJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'geoJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'geoJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'geoJson', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  geoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'geoJson', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  isPhotoEncryptedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isPhotoEncrypted', value: value),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdated'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdated'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  lastUpdatedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  lastUpdatedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'markerType'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'markerType'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'markerType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'markerType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'markerType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'markerType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'markerType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'markerType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'markerType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'markerType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'markerType', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  markerTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'markerType', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'name'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'name'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoBase64'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoBase64'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64EqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoBase64',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoBase64',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoBase64',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoBase64',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64StartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoBase64',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64EndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoBase64',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoBase64',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoBase64',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoBase64', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoBase64', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'state'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'state'),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'state',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'state',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'state',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'state',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'state',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'state',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'state',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'state',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'state', value: ''),
      );
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterFilterCondition>
  stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'state', value: ''),
      );
    });
  }
}

extension SubjectRecordQueryObject
    on QueryBuilder<SubjectRecord, SubjectRecord, QFilterCondition> {}

extension SubjectRecordQueryLinks
    on QueryBuilder<SubjectRecord, SubjectRecord, QFilterCondition> {}

extension SubjectRecordQuerySortBy
    on QueryBuilder<SubjectRecord, SubjectRecord, QSortBy> {
  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByCaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseId', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByCaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseId', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByCountyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByIsPhotoEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhotoEncrypted', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByIsPhotoEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhotoEncrypted', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByMarkerType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markerType', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByMarkerTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markerType', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByPhotoBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByPhotoBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension SubjectRecordQuerySortThenBy
    on QueryBuilder<SubjectRecord, SubjectRecord, QSortThenBy> {
  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByCaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseId', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByCaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caseId', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByCountyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByIsPhotoEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhotoEncrypted', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByIsPhotoEncryptedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhotoEncrypted', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByMarkerType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markerType', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByMarkerTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markerType', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByPhotoBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByPhotoBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy>
  thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension SubjectRecordQueryWhereDistinct
    on QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> {
  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByCaseId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByCounty({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'county', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByGeoJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct>
  distinctByIsPhotoEncrypted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPhotoEncrypted');
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct>
  distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByMarkerType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'markerType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByPhotoBase64({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoBase64', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectRecord, SubjectRecord, QDistinct> distinctByState({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }
}

extension SubjectRecordQueryProperty
    on QueryBuilder<SubjectRecord, SubjectRecord, QQueryProperty> {
  QueryBuilder<SubjectRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> caseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caseId');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> countyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'county');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> geoJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJson');
    });
  }

  QueryBuilder<SubjectRecord, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<SubjectRecord, bool, QQueryOperations>
  isPhotoEncryptedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPhotoEncrypted');
    });
  }

  QueryBuilder<SubjectRecord, DateTime?, QQueryOperations>
  lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> markerTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'markerType');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> photoBase64Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoBase64');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<SubjectRecord, String?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }
}
