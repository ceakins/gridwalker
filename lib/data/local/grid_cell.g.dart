// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_cell.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGridCellCollection on Isar {
  IsarCollection<GridCell> get gridCells => this.collection();
}

const GridCellSchema = CollectionSchema(
  name: r'GridCell',
  id: 7859944282167996329,
  properties: {
    r'county': PropertySchema(
      id: 0,
      name: r'county',
      type: IsarType.string,
    ),
    r'coverage': PropertySchema(
      id: 1,
      name: r'coverage',
      type: IsarType.double,
    ),
    r'geoJson': PropertySchema(
      id: 2,
      name: r'geoJson',
      type: IsarType.string,
    ),
    r'lastCleared': PropertySchema(
      id: 3,
      name: r'lastCleared',
      type: IsarType.dateTime,
    ),
    r'state': PropertySchema(
      id: 4,
      name: r'state',
      type: IsarType.string,
    ),
    r'x': PropertySchema(
      id: 5,
      name: r'x',
      type: IsarType.long,
    ),
    r'y': PropertySchema(
      id: 6,
      name: r'y',
      type: IsarType.long,
    )
  },
  estimateSize: _gridCellEstimateSize,
  serialize: _gridCellSerialize,
  deserialize: _gridCellDeserialize,
  deserializeProp: _gridCellDeserializeProp,
  idName: r'id',
  indexes: {
    r'x': IndexSchema(
      id: -1517593895512126191,
      name: r'x',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'x',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'y': IndexSchema(
      id: 2822446240451570149,
      name: r'y',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'y',
          type: IndexType.value,
          caseSensitive: false,
        )
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
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'state': IndexSchema(
      id: 7917036384617311412,
      name: r'state',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'state',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _gridCellGetId,
  getLinks: _gridCellGetLinks,
  attach: _gridCellAttach,
  version: '3.1.0+1',
);

int _gridCellEstimateSize(
  GridCell object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.county.length * 3;
  bytesCount += 3 + object.geoJson.length * 3;
  bytesCount += 3 + object.state.length * 3;
  return bytesCount;
}

void _gridCellSerialize(
  GridCell object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.county);
  writer.writeDouble(offsets[1], object.coverage);
  writer.writeString(offsets[2], object.geoJson);
  writer.writeDateTime(offsets[3], object.lastCleared);
  writer.writeString(offsets[4], object.state);
  writer.writeLong(offsets[5], object.x);
  writer.writeLong(offsets[6], object.y);
}

GridCell _gridCellDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GridCell();
  object.county = reader.readString(offsets[0]);
  object.coverage = reader.readDouble(offsets[1]);
  object.geoJson = reader.readString(offsets[2]);
  object.id = id;
  object.lastCleared = reader.readDateTime(offsets[3]);
  object.state = reader.readString(offsets[4]);
  object.x = reader.readLong(offsets[5]);
  object.y = reader.readLong(offsets[6]);
  return object;
}

P _gridCellDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gridCellGetId(GridCell object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gridCellGetLinks(GridCell object) {
  return [];
}

void _gridCellAttach(IsarCollection<dynamic> col, Id id, GridCell object) {
  object.id = id;
}

extension GridCellQueryWhereSort on QueryBuilder<GridCell, GridCell, QWhere> {
  QueryBuilder<GridCell, GridCell, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhere> anyX() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'x'),
      );
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhere> anyY() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'y'),
      );
    });
  }
}

extension GridCellQueryWhere on QueryBuilder<GridCell, GridCell, QWhereClause> {
  QueryBuilder<GridCell, GridCell, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> xEqualTo(int x) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'x',
        value: [x],
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> xNotEqualTo(int x) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'x',
              lower: [],
              upper: [x],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'x',
              lower: [x],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'x',
              lower: [x],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'x',
              lower: [],
              upper: [x],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> xGreaterThan(
    int x, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'x',
        lower: [x],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> xLessThan(
    int x, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'x',
        lower: [],
        upper: [x],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> xBetween(
    int lowerX,
    int upperX, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'x',
        lower: [lowerX],
        includeLower: includeLower,
        upper: [upperX],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> yEqualTo(int y) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'y',
        value: [y],
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> yNotEqualTo(int y) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'y',
              lower: [],
              upper: [y],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'y',
              lower: [y],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'y',
              lower: [y],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'y',
              lower: [],
              upper: [y],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> yGreaterThan(
    int y, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'y',
        lower: [y],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> yLessThan(
    int y, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'y',
        lower: [],
        upper: [y],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> yBetween(
    int lowerY,
    int upperY, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'y',
        lower: [lowerY],
        includeLower: includeLower,
        upper: [upperY],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> countyEqualTo(
      String county) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'county',
        value: [county],
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> countyNotEqualTo(
      String county) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'county',
              lower: [],
              upper: [county],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'county',
              lower: [county],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'county',
              lower: [county],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'county',
              lower: [],
              upper: [county],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> stateEqualTo(
      String state) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'state',
        value: [state],
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterWhereClause> stateNotEqualTo(
      String state) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [],
              upper: [state],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [state],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [state],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'state',
              lower: [],
              upper: [state],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GridCellQueryFilter
    on QueryBuilder<GridCell, GridCell, QFilterCondition> {
  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'county',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'county',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'county',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'county',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'county',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'county',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'county',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'county',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'county',
        value: '',
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> countyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'county',
        value: '',
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> coverageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> coverageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> coverageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> coverageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> geoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> lastClearedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCleared',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition>
      lastClearedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCleared',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> lastClearedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCleared',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> lastClearedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCleared',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> xEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> xGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> xLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> xBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> yEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> yGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> yLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y',
        value: value,
      ));
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterFilterCondition> yBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GridCellQueryObject
    on QueryBuilder<GridCell, GridCell, QFilterCondition> {}

extension GridCellQueryLinks
    on QueryBuilder<GridCell, GridCell, QFilterCondition> {}

extension GridCellQuerySortBy on QueryBuilder<GridCell, GridCell, QSortBy> {
  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByCountyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByCoverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverage', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByCoverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverage', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByLastCleared() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCleared', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByLastClearedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCleared', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> sortByYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.desc);
    });
  }
}

extension GridCellQuerySortThenBy
    on QueryBuilder<GridCell, GridCell, QSortThenBy> {
  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByCounty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByCountyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'county', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByCoverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverage', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByCoverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverage', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByLastCleared() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCleared', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByLastClearedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCleared', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.desc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.asc);
    });
  }

  QueryBuilder<GridCell, GridCell, QAfterSortBy> thenByYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.desc);
    });
  }
}

extension GridCellQueryWhereDistinct
    on QueryBuilder<GridCell, GridCell, QDistinct> {
  QueryBuilder<GridCell, GridCell, QDistinct> distinctByCounty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'county', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GridCell, GridCell, QDistinct> distinctByCoverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverage');
    });
  }

  QueryBuilder<GridCell, GridCell, QDistinct> distinctByGeoJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GridCell, GridCell, QDistinct> distinctByLastCleared() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCleared');
    });
  }

  QueryBuilder<GridCell, GridCell, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GridCell, GridCell, QDistinct> distinctByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'x');
    });
  }

  QueryBuilder<GridCell, GridCell, QDistinct> distinctByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'y');
    });
  }
}

extension GridCellQueryProperty
    on QueryBuilder<GridCell, GridCell, QQueryProperty> {
  QueryBuilder<GridCell, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GridCell, String, QQueryOperations> countyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'county');
    });
  }

  QueryBuilder<GridCell, double, QQueryOperations> coverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverage');
    });
  }

  QueryBuilder<GridCell, String, QQueryOperations> geoJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJson');
    });
  }

  QueryBuilder<GridCell, DateTime, QQueryOperations> lastClearedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCleared');
    });
  }

  QueryBuilder<GridCell, String, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<GridCell, int, QQueryOperations> xProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'x');
    });
  }

  QueryBuilder<GridCell, int, QQueryOperations> yProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'y');
    });
  }
}
