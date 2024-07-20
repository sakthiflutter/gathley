import 'package:gatherly/data/datasource/local/localdb.dart';
import 'package:realm/realm.dart';

part "stallsmedia_model.g.dart";

@RealmModel()
class _StallsMedia {
  @PrimaryKey()
  int? id;
  late int stallsid;
  _Mediapath? media;
  void save() {
    var r = getIt<Realm>();

    r.write(() {
      var data = this as StallsMedia;

      r.add<StallsMedia>(data);
    });
  }

  int getNextId() {
    var models = r.all<StallsMedia>();
    final lastModel = models.isNotEmpty ? models.last : null;
    return lastModel?.id!=null?(lastModel!.id! + 1):1;
  }
}

@RealmModel(ObjectType.embeddedObject)
class _Mediapath {
  late String sourcepath;
  late String thumbnailpath;
}
