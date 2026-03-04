// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGpsTrackCollection on Isar {
  IsarCollection<GpsTrack> get gpsTracks => this.collection();
}

const GpsTrackSchema = CollectionSchema(
  name: r'GpsTrack',
  id: -240595794433070309,
  properties: {
    r'county': PropertySchema(id: 0, name: r'county', type: IsarType.string),
    r'endTime': PropertySchema(
      id: 1,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'geoJson': PropertySchema(id: 2, name: r'geoJson', type: IsarType.string),
    r'maxLat': PropertySchema(id: 3, name: r'maxLat', type: IsarType.double),
    r'maxLng': PropertySchema(id: 4, name: r'maxLng', type: IsarType.double),
    r'minLat': PropertySchema(id: 5, name: r'minLat', type: IsarType.double),
    r'minLng': PropertySchema(id: 6, name: r'minLng', type: IsarType.double),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'state': PropertySchema(id: 8, name: r'state', type: IsarType.string),
    r'userId': PropertySchema(id: 9, name: r'userId', type: IsarType.string),
  },

  estimateSize: _gpsTrackEstimateSize,
  serialize: _gpsTrackSerialize,
  deserialize: _gpsTrackDeserialize,
  deserializeProp: _gpsTrackDeserializeProp,
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
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _gpsTrackGetId,
  getLinks: _gpsTrackGetLinks,
  attach: _gpsTrackAttach,
  version: '3.3.0',
);

int _gpsTrackEstimateSize(
  GpsTrack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.county.length * 3;
  bytesCount += 3 + object.geoJson.length * 3;
  bytesCount += 3 + object.state.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _gpsTrackSerialize(
  GpsTrack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.county);
  writer.writeDateTime(offsets[1], object.endTime);
  writer.writeString(offsets[2], object.geoJson);
  writer.writeDouble(offsets[3], object.maxLat);
  writer.writeDouble(offsets[4], object.maxLng);
  writer.writeDouble(offsets[5], object.minLat);
  writer.writeDouble(offsets[6], object.minLng);
  writer.writeDateTime(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.state);
  writer.writeString(offsets[9], object.userId);
}

GpsTrack _gpsTrackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GpsTrack();
  object.county = reader.readString(offsets[0]);
  object.endTime = reader.readDateTime(offsets[1]);
  object.geoJson = reader.readString(offsets[2]);
  object.id = id;
  object.maxLat = reader.readDouble(offsets[3]);
  object.maxLng = reader.readDouble(offsets[4]);
  object.minLat = reader.readDouble(offsets[5]);
  object.minLng = reader.readDouble(offsets[6]);
  object.startTime = reader.readDateTime(offsets[7]);
  object.state = reader.readString(offsets[8]);
  object.userId = reader.readString(offsets[9]);
  return object;
}

P _gpsTrackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gpsTrackGetId(GpsTrack object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gpsTrackGetLinks(GpsTrack object) {
  return [];
}

void _gpsTrackAttach(IsarCollection<dynamic> col, Id id, GpsTrack object) {
  object.id = id;
}

extension GpsTrackQueryWhereSort on QueryBuilder<GpsTrack, GpsTrack, QWhere> {
  QueryBuilder<GpsTrack, GpsTrack, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhere> anyState() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'state'),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhere> anyCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'county'),
      );
    });
  }
}

extension GpsTrackQueryWhere on QueryBuilder<GpsTrack, GpsTrack, QWhereClause> {
  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> idBetween(
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateEqualTo(
    String state,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'state', value: [state]),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateNotEqualTo(
    String state,
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateGreaterThan(
    String state, {
    bool include = false,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateLessThan(
    String state, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateBetween(
    String lowerState,
    String upperState, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateStartsWith(
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'state', value: ['']),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> stateIsNotEmpty() {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyEqualTo(
    String county,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'county', value: [county]),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyNotEqualTo(
    String county,
  ) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyGreaterThan(
    String county, {
    bool include = false,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyLessThan(
    String county, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyBetween(
    String lowerCounty,
    String upperCounty, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyStartsWith(
    String CountyPrefix,
  ) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'county', value: ['']),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> countyIsNotEmpty() {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> userIdEqualTo(
    String userId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterWhereClause> userIdNotEqualTo(
    String userId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension GpsTrackQueryFilter
    on QueryBuilder<GpsTrack, GpsTrack, QFilterCondition> {
  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyGreaterThan(
    String value, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyLessThan(
    String value, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyBetween(
    String lower,
    String upper, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'county', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> countyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'county', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> endTimeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endTime', value: value),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonGreaterThan(
    String value, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonLessThan(
    String value, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonBetween(
    String lower,
    String upper, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'geoJson', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> geoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'geoJson', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'maxLat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxLat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxLat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxLat',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'maxLng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxLng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxLng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> maxLngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxLng',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'minLat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minLat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minLat',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minLat',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'minLng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minLng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minLng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> minLngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minLng',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> startTimeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startTime', value: value),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateGreaterThan(
    String value, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateLessThan(
    String value, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateBetween(
    String lower,
    String upper, {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'state', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'state', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension GpsTrackQueryObject
    on QueryBuilder<GpsTrack, GpsTrack, QFilterCondition> {}

extension GpsTrackQueryLinks
    on QueryBuilder<GpsTrack, GpsTrack, QFilterCondition> {}

extension GpsTrackQuerySortBy on QueryBuilder<GpsTrack, GpsTrack, QSortBy> {
  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByCountyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMaxLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLat', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMaxLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLat', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMaxLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLng', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMaxLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLng', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMinLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLat', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMinLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLat', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMinLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLng', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByMinLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLng', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension GpsTrackQuerySortThenBy
    on QueryBuilder<GpsTrack, GpsTrack, QSortThenBy> {
  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByCountyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMaxLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLat', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMaxLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLat', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMaxLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLng', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMaxLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLng', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMinLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLat', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMinLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLat', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMinLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLng', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByMinLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLng', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension GpsTrackQueryWhereDistinct
    on QueryBuilder<GpsTrack, GpsTrack, QDistinct> {
  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByCounty({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'county', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByGeoJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByMaxLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLat');
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByMaxLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLng');
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByMinLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minLat');
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByMinLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minLng');
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByState({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GpsTrack, GpsTrack, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension GpsTrackQueryProperty
    on QueryBuilder<GpsTrack, GpsTrack, QQueryProperty> {
  QueryBuilder<GpsTrack, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GpsTrack, String, QQueryOperations> countyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'county');
    });
  }

  QueryBuilder<GpsTrack, DateTime, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<GpsTrack, String, QQueryOperations> geoJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJson');
    });
  }

  QueryBuilder<GpsTrack, double, QQueryOperations> maxLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLat');
    });
  }

  QueryBuilder<GpsTrack, double, QQueryOperations> maxLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLng');
    });
  }

  QueryBuilder<GpsTrack, double, QQueryOperations> minLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minLat');
    });
  }

  QueryBuilder<GpsTrack, double, QQueryOperations> minLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minLng');
    });
  }

  QueryBuilder<GpsTrack, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<GpsTrack, String, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<GpsTrack, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
