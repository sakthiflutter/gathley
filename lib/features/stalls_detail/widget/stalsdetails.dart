import 'package:flutter/material.dart';
import 'package:gatherly/features/home/controllers/home_controllers.dart';
import 'package:gatherly/utill/color_resources.dart';
import 'package:gatherly/utill/custom_themes.dart';

class StalsDetails extends StatelessWidget {
  int stallid;
  StalsDetails({super.key, required this.stallid});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "TechTrends",
            style: textBold.copyWith(fontSize: 28),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("TechTrends Technologies",
              style: textRegular.copyWith(
                color: ColorResources.testDarkGrey,
              )),
          const SizedBox(
            height: 10,
          ),
          Text("${HomeControl.stallsfilescount(stallid)} Files",
              style: textRegular.copyWith(
                color: ColorResources.testDarkGrey,
              ))
        ]);
  }
}
