import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 1.obs;

   updateIndex(int newIndex) {
    currentIndex.value = newIndex;
  }
}
