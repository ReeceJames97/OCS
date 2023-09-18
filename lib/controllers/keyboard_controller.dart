import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class KeyboardController extends GetxController {
  final KeyboardVisibilityController _keyboardVisibilityController =
  KeyboardVisibilityController();

  RxBool isKeyboardVisible = false.obs;

  void setKeyboardVisible(bool value) {
    isKeyboardVisible.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    _keyboardVisibilityController.onChange.listen((bool isVisible) {
      setKeyboardVisible(isVisible);
    });
  }
}