// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stallsmedia_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class StallsMedia extends _StallsMedia
    with RealmEntity, RealmObjectBase, RealmObject {
  StallsMedia(
    int? id,
    int stallsid, {
    Mediapath? media,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'stallsid', stallsid);
    RealmObjectBase.set(this, 'media', media);
  }

  StallsMedia._();

  @override
  int? get id => RealmObjectBase.get<int>(this, 'id') as int?;
  @override
  set id(int? value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get stallsid => RealmObjectBase.get<int>(this, 'stallsid') as int;
  @override
  set stallsid(int value) => RealmObjectBase.set(this, 'stallsid', value);

  @override
  Mediapath? get media =>
      RealmObjectBase.get<Mediapath>(this, 'media') as Mediapath?;
  @override
  set media(covariant Mediapath? value) =>
      RealmObjectBase.set(this, 'media', value);

  @override
  Stream<RealmObjectChanges<StallsMedia>> get changes =>
      RealmObjectBase.getChanges<StallsMedia>(this);

  @override
  StallsMedia freeze() => RealmObjectBase.freezeObject<StallsMedia>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(StallsMedia._);
    return const SchemaObject(
        ObjectType.realmObject, StallsMedia, 'StallsMedia', [
      SchemaProperty('id', RealmPropertyType.int,
          optional: true, primaryKey: true),
      SchemaProperty('stallsid', RealmPropertyType.int),
      SchemaProperty('media', RealmPropertyType.object,
          optional: true, linkTarget: 'Mediapath'),
    ]);
  }
}

class Mediapath extends _Mediapath
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  Mediapath(
    String sourcepath,
    String thumbnailpath,
  ) {
    RealmObjectBase.set(this, 'sourcepath', sourcepath);
    RealmObjectBase.set(this, 'thumbnailpath', thumbnailpath);
  }

  Mediapath._();

  @override
  String get sourcepath =>
      RealmObjectBase.get<String>(this, 'sourcepath') as String;
  @override
  set sourcepath(String value) =>
      RealmObjectBase.set(this, 'sourcepath', value);

  @override
  String get thumbnailpath =>
      RealmObjectBase.get<String>(this, 'thumbnailpath') as String;
  @override
  set thumbnailpath(String value) =>
      RealmObjectBase.set(this, 'thumbnailpath', value);

  @override
  Stream<RealmObjectChanges<Mediapath>> get changes =>
      RealmObjectBase.getChanges<Mediapath>(this);

  @override
  Mediapath freeze() => RealmObjectBase.freezeObject<Mediapath>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Mediapath._);
    return const SchemaObject(
        ObjectType.embeddedObject, Mediapath, 'Mediapath', [
      SchemaProperty('sourcepath', RealmPropertyType.string),
      SchemaProperty('thumbnailpath', RealmPropertyType.string),
    ]);
  }
}
