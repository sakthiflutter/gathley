import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gatherly/features/stalls_detail/controllers/stallsdetail_controller.dart';
import 'package:gatherly/features/stalls_detail/widget/media_fullscreen.dart';
import 'package:gatherly/features/stalls_detail/widget/progress_widget.dart';
import 'package:gatherly/utill/custom_themes.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:get/get.dart';

import '../../../utill/color_resources.dart';

class CarouselSlide extends StatefulWidget {
 final int stallsid;
 const CarouselSlide({super.key, required this.stallsid});

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  Timer? _timer;
  StallsdetailCon con = Get.find<StallsdetailCon>();
  void _onPageChanged(int index) {
    _currentPage = index;
    setState(() {});
  }

  getrecord() {
    con.getstallsmedia(widget.stallsid);
  }



  @override
  void initState() {
    getrecord();

    super.initState();

    // _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 414,
      width: Dimensions.maxWidth,
      child: GetBuilder<StallsdetailCon>(
          init: StallsdetailCon(),
          builder: (controller) {
            // _startAutoSlide(controller.stallsmedia.length);
            return Stack(
              children: [
                SizedBox(
                  height: 414,
                  child: Column(children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: controller.stallthumbnail.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => FullScreenMedia(
                                    filepath: controller
                                        .stallthumbnail[index].sourcepath,
                                    type: controller.stallthumbnail[index]
                                                .thumbnailpath !=
                                            null
                                        ? 2
                                        : 1,
                                  ));
                            },
                            child: Image.file(
                              File(
                                controller.stallthumbnail[index]
                                                .thumbnailpath !=
                                            null &&
                                        controller.stallthumbnail[index]
                                                .thumbnailpath !=
                                            ""
                                    ? controller
                                        .stallthumbnail[index].thumbnailpath!
                                    : controller
                                        .stallthumbnail[index].sourcepath,
                              ),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
                Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: SizedBox(
                      width: Dimensions.maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() => Get.back()),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: const Icon(
                              Icons.share,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    )),
                controller.stallthumbnail.isEmpty?Center(child: SizedBox(child: Text("No Files",style: textBold.copyWith(fontSize: 20),),)):   controller.stallthumbnail[_currentPage]
                    .thumbnailpath !=
                    null?Positioned(
                  bottom: 25,
                  left: 10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorResources.stallsButton
                    ),
                    child: const Icon(Icons.play_arrow,color: Colors.white,size: 40,),

                  ),
                ):const SizedBox(),
                Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: Dimensions.maxWidth,
                      child: MediaProgressBar(
                          count: controller.stallthumbnail.length,
                          currentIndex: _currentPage + 1,
                          duration: const Duration(seconds: 3)),
                    )),
              ],
            );
          }),
    );
  }
}
