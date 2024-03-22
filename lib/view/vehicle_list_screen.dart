import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/Components/vehicle_component.dart';
import 'package:loadclear/view/on%20boarding/edit_vehicle_screen.dart';
import 'package:loadclear/view/vehicle_detail_screen.dart';
import 'package:loadclear/view_model/switch_vehicle_controller.dart';

// ignore: must_be_immutable
class VehicleListScreen extends StatelessWidget {
  VehicleListScreen({super.key});

  final SwitchVehicleController _switchVehicleController =
      Get.put(SwitchVehicleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: 'Vehicle Profile',
              isBackButton: true,
            )),
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _switchVehicleController.vehicleImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: VehicleComponent(
                        vehicleImage: _switchVehicleController
                            .vehicleImages[index]['image'],
                        vehicleName: _switchVehicleController
                            .vehicleImages[index]['name'],
                        vehicleType: _switchVehicleController
                            .vehicleImages[index]['type'],
                        isEdit: true,
                        onClick: () {
                          Get.to(VehicleDetailScreen());
                        },
                      ),
                    );
                  },
                ),
                Constants.verticalSpace(100.0.h),
                ButtonComponent(
                  text: 'Add vehicles',
                  onPressed: () => Get.to(() => EditVehicleScreen(),
                      arguments: 'from add vehicles'),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
