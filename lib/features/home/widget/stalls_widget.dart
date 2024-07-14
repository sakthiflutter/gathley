import 'package:flutter/material.dart';
import 'package:gatherly/utill/color_resources.dart';
import 'package:gatherly/utill/custom_themes.dart';

class StallsWidget extends StatelessWidget {
  const StallsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
          itemBuilder: (context,index){
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 250,

            decoration: BoxDecoration(
                color: ColorResources.stallsContainer,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Column(

              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
                    
                  ),

                  height: 150,
                  child: Image.asset("assets/images/png/img.png"),
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
                            child: Text("Jun 24 - Jun 25, 2024",style: textRegular.copyWith(fontWeight: FontWeight.w500,color:  ColorResources.testDarkGrey),),
                          ) ,
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text("TechTrends",style: textBold.copyWith(fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text("TechTrends Technologies",style: textRegular.copyWith(fontWeight: FontWeight.w400,color:  ColorResources.testDarkGrey ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text("15 Files",style: textRegular.copyWith(color: ColorResources.testDarkGrey),),
                          ),


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18 ),
                      child: Container(
                        height: 50,
                        width: 50,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorResources.stallsButton,
                        ),
                        child:  Center(child: Icon(Icons.add,weight: 20,size: 30,color: ColorResources.stallsIcon,)),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
