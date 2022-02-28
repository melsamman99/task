import 'package:flutter/material.dart';
import 'package:task/AppUtilities/utilities.dart';
import 'package:task/Shared/components.dart';
class HouseDetailScreen extends StatefulWidget {
  const HouseDetailScreen({Key? key}) : super(key: key);

  @override
  _HouseDetailScreenState createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/bigHouse.jpeg",width: double.infinity,fit: BoxFit.fill,height: MediaQuery.of(context).size.height*0.54,),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.05,left: 20,
                    child: InkWell(
                        onTap:(){
                      Navigator.pop(context);
                    },child: CircleBackground(icon: Icons.arrow_back_ios,iconColor: Utilities.whiteColor,backColor: Colors.black.withOpacity(0.2),))),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.39,
                  child: Container(
                    height: 70,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),topRight: Radius.circular(100),topLeft: Radius.circular(100)),
                      color: Colors.black.withOpacity(0.3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_arrow_up,color: Utilities.whiteColor,),
                        CustomText(text: "3D Tour",color: Utilities.whiteColor,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
              color: Utilities.inputColor,
            ),
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Brooklyn / New York",fontSize: 16,),
                  const SizedBox(height: 15,),
                  CustomText(text: "Detail Oriented House",fontWeight: FontWeight.bold,fontSize: 22,),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset("images/bed.png",height: 22,width: 22,fit: BoxFit.fill,),
                          CustomText(text: "3",color: Utilities.iconColor,fontWeight: FontWeight.bold,),
                          const SizedBox(width: 15,),
                          Image.asset("images/water.png",height: 22,width: 22,fit: BoxFit.fill,),
                          CustomText(text: "5",color: Utilities.iconColor,fontWeight: FontWeight.bold,),
                          const SizedBox(width: 15,),
                          Row(
                            children: [
                              Image.asset("images/foukus.png",height: 21,width: 18,fit: BoxFit.fill,),
                              const SizedBox(width: 3,),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                        height: 26,
                                        width: 45,
                                        alignment: Alignment.bottomLeft,
                                        child: CustomText(text: "180",color: Utilities.iconColor,fontWeight: FontWeight.bold,)),
                                    CustomText(text: "m2",color: Utilities.iconColor,fontWeight: FontWeight.bold,fontSize: 13,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Utilities.secondColor.withOpacity(0.3),
                        border: Border.all(color: Utilities.whiteColor,width: 2)
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading:  ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: Image.asset("images/houses.png",fit: BoxFit.fill,height: 50,),
                            ),
                            title: CustomText(text: "Alyssa Watson",fontWeight: FontWeight.bold,fontSize: 16,),
                            subtitle: CustomText(text: "Owner",fontWeight: FontWeight.bold,fontSize: 16,color: Utilities.mainColor,),
                            trailing: CircleBackground(icon: Icons.phone,iconColor: Utilities.mainColor,),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.72,
                              child: CustomText(text: "bhjbhjbhjbhjbhjbhjbhjbhjbhjbhjbhjbhjbhjbjhbhhjhjbjhbnjkncjkdnscjkdsncdjksndsjkcndjsjhbhbkjbjbhjbhjbhjbhjghjvgyxersewretytgyuguihihuihyuyugjbhjbhjbhjbhjbhjbhjbhjbhjbhjbhjbhbbhjbhjbhbhjbhjbhjbhjbhbhjbhbhbhbhj"))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(flex: 2,child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: "\$3.100",fontSize: 20,fontWeight: FontWeight.w600,),
                        ],
                      )),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 57,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Utilities.mainColor),
                          child: CustomText(text: "BOOK A HOUSE",color: Utilities.whiteColor,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
