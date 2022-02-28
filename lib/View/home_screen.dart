import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/AppUtilities/utilities.dart';
import 'package:task/Controllers/products_controller.dart';
import 'package:task/Models/products_model.dart';
import 'package:task/Shared/components.dart';

import 'house_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final ProductsController productController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                right: 85,top: 0,
                child: ClipPath(
                  clipper: CustomTriangleClipper(),
                  child: Container(
                    width: 40,
                    height: MediaQuery.of(context).size.height*0.21,
                    color: Utilities.secondColor,
                  ),
                )
              ),
              Positioned(
                right: 0,top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60)),
                    color: Utilities.mainColor
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top,),
                Row(
                  children: [
                    CircleBackground(icon: Icons.grid_view),
                    const Spacer(),
                    CircleBackground(icon: Icons.filter_list,iconColor: Colors.white,),
                  ],
                ),
                SizedBox(height:  MediaQuery.of(context).size.height*0.035,),
                CustomInput(controller: TextEditingController(), hint: "Search house", textInputType: TextInputType.text,prefixIcon: Icon(Icons.home,color: Utilities.iconColor,),suffixIcon: Icon(Icons.mic_none_outlined,color: Utilities.iconColor,),),
                const SizedBox(height: 30,),
                const Text.rich(TextSpan(text: "Houses",children: <TextSpan>[
                  TextSpan(text:' in New York', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],),style: TextStyle(fontSize: 17),),
                const SizedBox(height: 15,),
                Expanded(
                  child: Obx (() {
                    if (productController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.separated(
                        shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context,index){
                        return RenderHouses(product: productController.productList[index],);
                      }, separatorBuilder: (context,index){
                          return const SizedBox(height: 20,);
                        }, itemCount: productController.productList.length
                      );
                    }
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RenderHouses extends StatelessWidget {
  Data product;
  RenderHouses({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const HouseDetailScreen());
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Utilities.whiteColor),
            color: Utilities.inputColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(product.photo!,fit: BoxFit.fill,),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "\$${product.price}",fontSize: 18,fontWeight: FontWeight.bold,),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        const Icon(Icons.home,size: 16,),
                        const SizedBox(width: 5,),
                        CustomText(text: "Manhattan / New York",),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Image.asset("images/wave.png",width: 40,),
                    const SizedBox(height: 5,),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

