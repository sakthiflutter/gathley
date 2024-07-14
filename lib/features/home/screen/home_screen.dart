import 'package:flutter/material.dart';
import 'package:gatherly/features/home/widget/search_widget.dart';
import 'package:gatherly/features/home/widget/stalls_widget.dart';
import 'package:gatherly/utill/custom_themes.dart';
import 'package:gatherly/utill/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeEight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SearchWidget(),
              SizedBox(
                height: 10,
              ),
              Text("Stalls",style: textBold.copyWith(fontSize:Dimensions. fontSizeOverLarge),),
              SizedBox(
                height: 20,
              ),
              StallsWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
