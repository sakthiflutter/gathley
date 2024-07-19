import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gatherly/data/datasource/local/localdb.dart';
import 'package:gatherly/features/stalls_detail/domain/model/stallsmedia_model.dart';
import 'package:gatherly/features/stalls_detail/domain/model/thumbnamil_model.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:path_provider/path_provider.dart';

class StallsdetailCon extends GetxController {
  List<File> stallsmedia = [];
  List<MediaFilePath> stallthumbnail = [];
  static List<MediaFilePath> stallthumbnailtemp = [];
  int id = 0;

  setfiles(List<File> media) async {
    stallthumbnail.clear();
    stallsmedia.addAll(media);
    for (var element in media) {
      if (isVideoFile(element.path)) {
        File thumbnail = await vediothumbnail(element.path);
        String destinationpath = await getDestinationFilePath(
            thumbnail.path.split("/").last.split(".").first);
        moveFile(thumbnail.path, destinationpath);
        String sourcedestinationpath = await getDestinationFilePath(
            element.path.split("/").last.split(".").first);
        moveFile(element.path, sourcedestinationpath);

        stallthumbnail.add(MediaFilePath(
            sourcepath: sourcedestinationpath, thumbnailpath: destinationpath));
      } else {
        String sourcedestinationpath = await getDestinationFilePath(
            element.path.split("/").last.split(".").first);
        moveFile(element.path, sourcedestinationpath);

        stallthumbnail.add(MediaFilePath(sourcepath: sourcedestinationpath));
      }
    }
    log(stallthumbnail.length.toString());
    update();
  }

  int currentPage = 0;
  Timer? timer;

  void onPageChanged(int index) {
    currentPage = index;
  }

  getstallsmedia(int id) {
    List<StallsMedia> stallsmedia = LocalDb.getstallsmedia(id) ?? [];
    for (var element in stallsmedia) {
      stallthumbnail.add(MediaFilePath(
          sourcepath: element.media!.sourcepath,
          thumbnailpath: element.media?.thumbnailpath == ""
              ? null
              : element.media?.thumbnailpath));
    }
    update();
  }

  addfiles(List<File> media, int id) async {
    stallsmedia.addAll(media);
    for (var element in media) {
      if (isVideoFile(element.path)) {
        File thumbnail = await vediothumbnail(element.path);
        String destination = await getDestinationFilePath(
            thumbnail.path.split("/").last.split(".").first);
        destination = "${destination}image";
        moveFile(thumbnail.path, destination);
        String sourcedestinationpath = await getDestinationFilePath(
            element.path.split("/").last.split(".").first);
        moveFile(element.path, sourcedestinationpath);
      
        stallthumbnail.add(MediaFilePath(
            sourcepath: sourcedestinationpath, thumbnailpath: destination));
        var stallsmedia = StallsMedia(null, id,
            media: Mediapath(sourcedestinationpath, destination));
        stallsmedia.id = stallsmedia.getNextId();
        stallsmedia.save();
      } else {
        String sourcedestinationpath = await getDestinationFilePath(
            element.path.split("/").last.split(".").first);
        moveFile(element.path, sourcedestinationpath);
        var stallsmedia =
            StallsMedia(null, id, media: Mediapath(sourcedestinationpath, ""));
        stallsmedia.id = stallsmedia.getNextId();

        stallsmedia.save();
        stallthumbnail.add(MediaFilePath(sourcepath: sourcedestinationpath));
      }
    }

    update();
  }

  bool isVideoFile(String path) {
    return path.endsWith('.mp4') ||
        path.endsWith('.mov') ||
        path.endsWith('.avi');
  }

  Future<File> vediothumbnail(String path) async {
    File file = await VideoCompress.getFileThumbnail(path);
    return file;
  }

  void moveFile(String sourcePath, String destinationPath) async {
    final sourceFile = File(sourcePath);

    try {
      await sourceFile.copy(destinationPath);
      await sourceFile.delete();
    } catch (e) {
    }
  }

  void createDirectory(String dirPath) async {
    final directory = Directory(dirPath);

    try {
      if (await directory.exists()) {
      } else {
        await directory.create(
            recursive:
                true); // Creates the directory and any necessary parent directories
      }
    } catch (e) 
    {
      if (kDebugMode) {
        print("unable to create");
      }
    }
  }

  Future<String> getDestinationFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path + fileName;
  }
}
