import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gatherly/features/stalls_detail/widget/vedio_widget.dart';
import 'package:gatherly/utill/dimensions.dart';

class FullScreenMedia extends StatelessWidget {
  String filepath;
  int type;
  FullScreenMedia({
    Key? key,
    required this.filepath,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.maxHeight,
      width: Dimensions.maxWidth,
      child: type==1?Image.file(
        File(filepath),
        fit: BoxFit.fill,
      ):FullScreenVideoPlayer(filepath: filepath,),
    );
  }
}
