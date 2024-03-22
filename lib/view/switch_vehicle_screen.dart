import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/Components/vehicle_component.dart';
import 'package:loadclear/view_model/switch_vehicle_controller.dart';

// ignore: must_be_immutable
class SwitchVehicleScreen extends StatelessWidget {
  SwitchVehicleScreen({super.key});

  final SwitchVehicleController _switchVehicleController =
      Get.put(SwitchVehicleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarComponent(
            title: 'Switch Vehicle',
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
          child: ListView.builder(
            itemCount: _switchVehicleController.vehicleImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: VehicleComponent(
                  vehicleImage: _switchVehicleController.vehicleImages[index]
                      ['image'],
                  vehicleName: _switchVehicleController.vehicleImages[index]
                      ['name'],
                  vehicleType: _switchVehicleController.vehicleImages[index]
                      ['type'],
                  isEdit: false,
                  onClick: () {
                    _switchVehicleController.updateImage(
                        _switchVehicleController.vehicleImages[index]['image']);

                    Get.back();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
