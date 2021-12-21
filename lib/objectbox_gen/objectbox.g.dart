// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import '../core_features/todo/src/data/model/local_todo.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 5275523772977526737),
      name: 'LocalTodo',
      lastPropertyId: const IdUid(4, 719938606306804403),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6903269600146217590),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8936847122196695477),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1997629207608425918),
            name: 'note',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 719938606306804403),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 5275523772977526737),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    LocalTodo: EntityDefinition<LocalTodo>(
        model: _entities[0],
        toOneRelations: (LocalTodo object) => [],
        toManyRelations: (LocalTodo object) => {},
        getId: (LocalTodo object) => object.id,
        setId: (LocalTodo object, int id) {
          object.id = id;
        },
        objectToFB: (LocalTodo object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final noteOffset = fbb.writeString(object.note);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, noteOffset);
          fbb.addInt64(3, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LocalTodo(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              title:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              note:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [LocalTodo] entity fields to define ObjectBox queries.
class LocalTodo_ {
  /// see [LocalTodo.id]
  static final id = QueryIntegerProperty<LocalTodo>(_entities[0].properties[0]);

  /// see [LocalTodo.title]
  static final title =
      QueryStringProperty<LocalTodo>(_entities[0].properties[1]);

  /// see [LocalTodo.note]
  static final note =
      QueryStringProperty<LocalTodo>(_entities[0].properties[2]);

  /// see [LocalTodo.date]
  static final date =
      QueryIntegerProperty<LocalTodo>(_entities[0].properties[3]);
}