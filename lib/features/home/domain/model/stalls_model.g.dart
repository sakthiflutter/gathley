// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stalls_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Stallsmodel extends _Stallsmodel
    with RealmEntity, RealmObjectBase, RealmObject {
  Stallsmodel(
    int? id, {
    String? title,
    String? name,
    int? filescount,
    DateTime? fromdate,
    DateTime? todate,
    String? imagepath,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'filescount', filescount);
    RealmObjectBase.set(this, 'fromdate', fromdate);
    RealmObjectBase.set(this, 'todate', todate);
    RealmObjectBase.set(this, 'imagepath', imagepath);
  }

  Stallsmodel._();

  @override
  int? get id => RealmObjectBase.get<int>(this, 'id') as int?;
  @override
  set id(int? value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  int? get filescount => RealmObjectBase.get<int>(this, 'filescount') as int?;
  @override
  set filescount(int? value) => RealmObjectBase.set(this, 'filescount', value);

  @override
  DateTime? get fromdate =>
      RealmObjectBase.get<DateTime>(this, 'fromdate') as DateTime?;
  @override
  set fromdate(DateTime? value) => RealmObjectBase.set(this, 'fromdate', value);

  @override
  DateTime? get todate =>
      RealmObjectBase.get<DateTime>(this, 'todate') as DateTime?;
  @override
  set todate(DateTime? value) => RealmObjectBase.set(this, 'todate', value);

  @override
  String? get imagepath =>
      RealmObjectBase.get<String>(this, 'imagepath') as String?;
  @override
  set imagepath(String? value) => RealmObjectBase.set(this, 'imagepath', value);

  @override
  Stream<RealmObjectChanges<Stallsmodel>> get changes =>
      RealmObjectBase.getChanges<Stallsmodel>(this);

  @override
  Stallsmodel freeze() => RealmObjectBase.freezeObject<Stallsmodel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Stallsmodel._);
    return const SchemaObject(
        ObjectType.realmObject, Stallsmodel, 'Stallsmodel', [
      SchemaProperty('id', RealmPropertyType.int,
          optional: true, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('filescount', RealmPropertyType.int, optional: true),
      SchemaProperty('fromdate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('todate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('imagepath', RealmPropertyType.string, optional: true),
    ]);
  }
}
