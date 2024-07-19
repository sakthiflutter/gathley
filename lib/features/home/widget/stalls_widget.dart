// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gatherly/features/home/controllers/home_controllers.dart';
import 'package:gatherly/helper/date_converter.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';

import 'package:gatherly/features/home/domain/model/stalls_model.dart';
import 'package:gatherly/features/stalls_detail/screen/stallsdetail_screen.dart';
import 'package:gatherly/utill/color_resources.dart';
import 'package:gatherly/utill/custom_themes.dart';

class StallsWidget extends StatefulWidget {
  RealmResults<Stallsmodel> stallsdetails;
  StallsWidget({
    Key? key,
    required this.stallsdetails,
  }) : super(key: key);

  @override
  State<StallsWidget> createState() => _StallsWidgetState();
}

class _StallsWidgetState extends State<StallsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.stallsdetails.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                Get.to(() => StalsDetail(
                      stallid: widget.stallsdetails[index].id!,
                    ))?.then((value) => setState(() {}));
              }),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: ColorResources.stallsContainer,
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14)),
                        ),
                        height: 150,
                        child:
                            Image.asset(widget.stallsdetails[index].imagepath!),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    DateConverter.formatDateRange(
                                        widget.stallsdetails[index].fromdate!,
                                        widget.stallsdetails[index].todate!),
                                    style: textRegular.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: ColorResources.testDarkGrey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    widget.stallsdetails[index].title!,
                                    style: textBold.copyWith(fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    widget.stallsdetails[index].name!,
                                    style: textRegular.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ColorResources.testDarkGrey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    "${HomeControl.stallsfilescount(widget.stallsdetails[index].id!)} Files",
                                    style: textRegular.copyWith(
                                        color: ColorResources.testDarkGrey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ColorResources.stallsButton,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                weight: 20,
                                size: 30,
                                color: ColorResources.stallsIcon,
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
