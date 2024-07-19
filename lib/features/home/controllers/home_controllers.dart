import 'package:gatherly/data/datasource/local/localdb.dart';
import 'package:gatherly/features/home/domain/model/stalls_model.dart';
import 'package:realm/realm.dart';

class HomeControl {
  static RealmResults<Stallsmodel>? getstallslist() {
    if (LocalDb.getStallsDetail() == null) {
      insertstallsdetail();
    }
    return LocalDb.getStallsDetail();
  }

  static insertstallsdetail() {
    Stallsmodel? tempstalls = Stallsmodel(0);

    for (int i = 0; i < 100; i++) {
      tempstalls = Stallsmodel(i,
          title: "TechTrends",
          name: "TechTrends Technology",
          filescount: 0,
          fromdate: DateTime.now(),
          imagepath: "assets/images/png/img.png",
          todate: DateTime.now().add(
            const Duration(days: 5),
          ));
      tempstalls.save();
    }
  }

  static int  stallsfilescount(int id) {
   return LocalDb.getstallsmedia(id)?.length ?? 0;
  }
}
