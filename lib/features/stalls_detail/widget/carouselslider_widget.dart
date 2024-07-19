import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gatherly/features/stalls_detail/controllers/stallsdetail_controller.dart';
import 'package:gatherly/features/stalls_detail/widget/media_fullscreen.dart';
import 'package:gatherly/features/stalls_detail/widget/progress_widget.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:get/get.dart';

class CarouselSlide extends StatefulWidget {
  int stallsid;
  CarouselSlide({super.key, required this.stallsid});

  @override
  State<CarouselSlide> createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  Timer? _timer;
  StallsdetailCon Con = Get.find<StallsdetailCon>();
  void _onPageChanged(int index) {
    _currentPage = index;
    setState(() {});
  }

  getrecord() {
    Con.getstallsmedia(widget.stallsid);
  }

  // void _startAutoSlide(int count) {
  //   _timer?.cancel();
  //   _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
  //     if (_currentPage < -1) {
  //       _currentPage++;
  //     } else {
  //       _currentPage = 0; // Loop back to the first slide
  //     }
  //     _pageController.animateToPage(
  //       _currentPage,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }

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
                Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: Dimensions.maxWidth,
                      child: StoryProgressBar(
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
