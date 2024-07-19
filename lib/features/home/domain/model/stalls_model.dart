import 'package:gatherly/data/datasource/local/localdb.dart';
import 'package:realm/realm.dart';
part "stalls_model.g.dart";

@RealmModel()
class _Stallsmodel {
  @PrimaryKey()
  int? id;
  String? title;
  String? name;
  int? filescount;
  DateTime? fromdate;
  DateTime? todate;
  String? imagepath;
  void save() {
    var r = getIt<Realm>();

    r.write(() {
      var realmVerifyDeviceInfo = this as Stallsmodel;

      r.add<Stallsmodel>(realmVerifyDeviceInfo);
    });
  }

  void deleteall() {
    var r = getIt<Realm>();
    var list = r.all<Stallsmodel>();
    if (list.isNotEmpty) {
      r.write(() {
        r.deleteAll<Stallsmodel>();
      });
    }
  }
}
