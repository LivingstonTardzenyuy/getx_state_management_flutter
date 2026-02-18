import 'package:get/get.dart';
import 'package:getx/services/http_service.dart';

import 'controller/assets_controller.dart';

Future<void> registerServices() async {
  Get.put(HttpService());
}

Future<void> registerController() async {
  Get.put(AssetsController());
}