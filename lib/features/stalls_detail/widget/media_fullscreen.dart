import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gatherly/features/stalls_detail/widget/vedio_widget.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:get/get.dart';

class FullScreenMedia extends StatelessWidget {
  final String filepath;
  final int type;
 const FullScreenMedia({
    Key? key,
    required this.filepath,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Dimensions.maxHeight,
          width: Dimensions.maxWidth,
          child: type==1?Image.file(
            File(filepath),
            fit: BoxFit.fill,
          ):FullScreenVideoPlayer(filepath: filepath,),
        ),
        Positioned(
          right: 20,
            top: 60,
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
          height: 30,
          width: 30,

          decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(30)
          ),
          child: const Icon(Icons.close),
        ),
            ))
      ],
    );
  }
}
