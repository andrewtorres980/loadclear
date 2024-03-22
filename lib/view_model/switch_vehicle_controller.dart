import 'package:get/get.dart';

class SwitchVehicleController extends GetxController {
  RxString imageSelected = 'assets/images/vehicle_image1.png'.obs;
  List<Map<String, dynamic>> vehicleImages = [
    {
      'image': 'assets/images/vehicle_image1.png',
      'name': 'Fire Brigade',
      'type': 'Firefighters'
    },
    {
      'image': 'assets/images/vehicle_image2.png',
      'name': 'School bus',
      'type': 'Passenger Vehicle'
    },
    {
      'image': 'assets/images/vehicle_image3.png',
      'name': 'Fire Brigade',
      'type': 'Beverage Truck'
    },
  ];
  updateImage(String image) {
    imageSelected.value = image;
  }
}
