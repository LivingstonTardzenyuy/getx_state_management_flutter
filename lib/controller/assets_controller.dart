import 'package:get/get.dart';
import 'package:getx/models/tracked_asset.dart';

class AssetsController extends GetxController{
  RxList<dynamic> trackedAssets = <TrackedAsset>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(trackedAssets);
  }

  void addTrackedAsset(String name, double amount) {
    trackedAssets.add(TrackedAsset(
      name: name,
      amount: amount,
    ));
  }
}