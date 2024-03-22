import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/view_model/themecontroller.dart';
import '../../common/constant.dart';
import '../destination_set_screen.dart';

class SearchDestinationListSheet extends StatelessWidget {
  SearchDestinationListSheet({super.key});

  final _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          // border: Border.all(color: Theme.of(context).hoverColor),
          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Elite Motors Repair",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                
                        Get.to(() => const DestinationSetScreen());
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _controller.isDarkModeEnabled.value?Theme.of(context).hintColor:null,
                      border: Border.all(
                        color: Theme.of(context).hintColor,
                      ),
                      shape: BoxShape.circle),
                  child: Image.asset(
                   _controller.isDarkModeEnabled.value? "assets/images/direction_dark.png": "assets/images/direction.png",
                    height: 24.sp,
                  ),
                ),
              ),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.location_on_outlined,color: Theme.of(context).primaryColor,),
            Constants.horizontalSpace(8.sp),
            Text('Address goes here',style: TextStyle(fontSize: 15.sp,color: Theme.of(context).hintColor,fontWeight: FontWeight.w400),)],),
         Constants.verticalSpace(8.sp),
          Text(
            'Bike repair shop . 38 38th street',
            style: TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
          ),
          Constants.verticalSpace(8.sp),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Closed  ',
              style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16.sp,
              ),
            ),
            TextSpan(
              text: 'Opens 10 am',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 16.sp,
              ),
            ),
          ])),
        ],
      ),
          );
    });
  }
}
