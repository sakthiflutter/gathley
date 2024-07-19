import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gatherly/features/stalls_detail/controllers/stallsdetail_controller.dart';
import 'package:gatherly/utill/color_resources.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:gatherly/utill/images.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddFiles extends StatelessWidget {
  int id;
   AddFiles({
    super.key,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform
            .pickFiles(allowMultiple: true, type: FileType.media);

        if (result != null) {
          List<File> files = result.paths.map((path) => File(path!)).toList();
          print(files.length);
          StallsdetailCon Con = Get.find<StallsdetailCon>();
          Con.addfiles(files,id);
        } else {
          // User canceled the picker
        }
      },
      child: DottedBorder(
          color: ColorResources.dotedDarkGrey,
          strokeWidth: 1,
          dashPattern: const [10, 20],
          child: Container(
            height: 100,
            width: Dimensions.maxWidth,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageResource.addFilesicon,
                    scale: 12,
                    color: ColorResources.testDarkGrey,
                  ),
                  Text("Attach Files")
                ],
              ),
            ),
          )),
    );
  }
}
