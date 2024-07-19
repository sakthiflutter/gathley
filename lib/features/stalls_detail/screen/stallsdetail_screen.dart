import 'package:flutter/material.dart';
import 'package:gatherly/features/stalls_detail/controllers/stallsdetail_controller.dart';
import 'package:gatherly/features/stalls_detail/widget/addfiles_widget.dart';
import 'package:gatherly/features/stalls_detail/widget/carouselslider_widget.dart';
import 'package:gatherly/features/stalls_detail/widget/stalsdetails.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:get/get.dart';

class StalsDetail extends StatefulWidget {
  int stallid;
  StalsDetail({super.key, required this.stallid});

  @override
  State<StalsDetail> createState() => _StalsDetailState();
}

class _StalsDetailState extends State<StalsDetail> {
  @override
  void initState() {
    Get.put(StallsdetailCon());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlide(
            stallsid: widget.stallid,
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeEight),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
               StalsDetails(stallid: widget.stallid,),
              const SizedBox(
                height: 20,
              ),
              AddFiles(
                id: widget.stallid,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
