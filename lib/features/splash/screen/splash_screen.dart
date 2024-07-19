import 'package:flutter/material.dart';
import 'package:gatherly/data/datasource/local/localdb.dart';
import 'package:gatherly/features/home/screen/home_screen.dart';
import 'package:gatherly/utill/app_constants.dart';
import 'package:gatherly/utill/custom_themes.dart';
import 'package:gatherly/utill/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getconnect();
    Future.delayed(const Duration(seconds: AppConstants.splashScreenTime), () {
      Get.off(const HomeScreen());
    });
    // TODO: implement initState
    super.initState();
  }

  getconnect() {
    LocalDb.connectLocalDb();
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(300))),
            ),
            Expanded(
              child: Center(
                child: Text(AppConstants.appName,
                    style: titleLogo.copyWith(
                        fontSize: Dimensions.fontSizeOverLarge,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(300))),
            ),
          ],
        ),
      ),
    );
  }
}
