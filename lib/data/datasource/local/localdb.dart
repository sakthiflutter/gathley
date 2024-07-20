import 'dart:typed_data';

import 'package:gatherly/features/home/domain/model/stalls_model.dart';
import 'package:gatherly/features/stalls_detail/domain/model/stallsmedia_model.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import 'package:convert/src/hex.dart';

late Realm r;
var getIt = GetIt.instance;

class LocalDb {
  static void connectLocalDb() {
    r = Realm(Configuration.local(
      encryptionKey: _hexTobytes(
          '748b2401b3ba109bd867ef2856ed2ace3575b994bb0e0f5a516da5d370bf1c1de7297a581baec676f3a65f95be719060d9cf508a6b4578e1bc30ef914e6541d7'),
      path:
          "${Configuration.defaultRealmPath.split("default.realm")[0]}\\gathley.realm",
      [Stallsmodel.schema, StallsMedia.schema, Mediapath.schema],
    ));

    if (getIt.isRegistered<Realm>()) {
      getIt.unregister<Realm>();
    }
    getIt.registerSingleton(r);
  }

  static Uint8List _hexTobytes(String hexString) {
    final encodeBytes = hex.decode(hexString);
    // return Uint8List.fromList(encodeBytes);
    return Uint8List.fromList(encodeBytes);
  }

  static RealmResults<Stallsmodel>? getStallsDetail() {
    var r = getIt<Realm>();
    var list = r.all<Stallsmodel>();
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  static List<StallsMedia>? getstallsmedia(int id) {
    var r = getIt<Realm>();
    var list = r
        .all<StallsMedia>().query("stallsid ==$id").toList()
       ;
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }
}
