 import 'package:get/get.dart';

class MyController extends GetxController {
  /// MyContoller를 Get 패키지에서 불러올 수 있는 변수
  static MyController get to => Get.find<MyController>();

  static void setController() {
    /// Get 패키지 안에 MyController가 등록됐는지 확인
    if(!Get.isRegistered<MyController>()){
      /// Get 패키지에 MyController를 추가
      Get.put(MyController(), permanent: true);
    }
  }

  RxInt count = 0.obs;

  void countUp() {
    count.value++;
  }
}