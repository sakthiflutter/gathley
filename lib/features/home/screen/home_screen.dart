import 'package:flutter/material.dart';
import 'package:gatherly/features/home/controllers/home_controllers.dart';
import 'package:gatherly/features/home/domain/model/stalls_model.dart';
import 'package:gatherly/features/home/widget/search_widget.dart';
import 'package:gatherly/features/home/widget/stalls_widget.dart';
import 'package:gatherly/utill/custom_themes.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:realm/realm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RealmResults<Stallsmodel>? homedetails;
  @override
  void initState() {
   homedetails= HomeControl.getstallslist();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeEight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Stalls",
                style:
                    textBold.copyWith(fontSize: Dimensions.fontSizeOverLarge),
              ),
              const SizedBox(
                height: 20,
              ),
               StallsWidget(stallsdetails: homedetails!,),
            ],
          ),
        ),
      ),
    );
  }
}
