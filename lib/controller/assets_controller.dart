import 'package:get/get.dart';
import 'package:getx/models/tracked_asset.dart';
import 'package:getx/services/http_service.dart';

import '../models/api_response.dart';

class AssetsController extends GetxController{
  RxList<dynamic> trackedAssets = <TrackedAsset>[].obs;
  RxList<Crypto> coinData = <Crypto>[].obs;
  RxBool loading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print(trackedAssets);
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HttpService httpService = Get.find();
    var responseData = await httpService.get("currencies");
    CurrenciesListAPIResponse currenciesListAPIResponse = CurrenciesListAPIResponse.fromJson(responseData);
    coinData.value = currenciesListAPIResponse.data ;
    loading.value = false;

  }
  void addTrackedAsset(String name, double amount) {
    trackedAssets.add(TrackedAsset(
      name: name,
      amount: amount,
    ));
    print("The printed asset is ${trackedAssets}");
  }

  double getPortfolioValue() {
    if (coinData.isEmpty) {
      return 0;
    }
    if (trackedAssets.isEmpty) {
      return 0;
    }
    double value = 0;
    for (TrackedAsset asset in trackedAssets) {
      value += (getAssetPrice(asset.name!)! * asset.amount!)!;
    }
    return value;
  }

  double? getAssetPrice(String name){
    Crypto? data = getCoinData(name);
    return data!.price.toDouble() ?? 0;
    // return data!.values?.uSD?.price?.toDouble() ?? 0;
  }

  Crypto? getCoinData(String name) {
    return coinData.firstWhereOrNull((element) => element.name == name);
  }
}