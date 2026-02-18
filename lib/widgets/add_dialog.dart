import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/assets_controller.dart';
import 'package:getx/models/api_response.dart';
import 'package:getx/services/http_service.dart';



class AddAssetDialogController extends GetxController{
  RxBool loading = false.obs;
  RxList<String> assets = <String>[].obs;
  RxString selectedAsset = "".obs;
  RxDouble assetValue = 0.0.obs;

  @override
  void onInit() {
    // TODO

    //  : implement onInit
      super.onInit();
      _getAssets();
    }

    Future<void> _getAssets() async {
      try {
        loading.value = true;
        HttpService httpService = Get.find();
        var response = await httpService.get("currencies");
        // print(response.data);
        CurrenciesListAPIResponse currenciesListAPIResponse = CurrenciesListAPIResponse.fromJson(response);
        currenciesListAPIResponse.data?.forEach((coin) {
          assets.add(
            coin.name!
          );
        });
        print("the assets are: ${assets} ");
        selectedAsset.value = assets.first;

        // selectedAsset.value = assets.first;
        loading.value = false;


        print(response);
        loading.value = false;

      } catch(e) {
        print("Error fetching aseets: $e");
      }
    }
  }


class AddAssetDialog extends StatelessWidget {

  final controller = Get.put(AddAssetDialogController());
  AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Center(
        child: Material(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.40,
            width: MediaQuery.sizeOf(context).height * 0.40,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
            ),
            child: _buildUI(context),
          ),
        ),
      )
    );
  }

  Widget _buildUI(BuildContext context) {
    if (controller.loading.isTrue) {
      return const Center(
        child: SizedBox(
          height: 30, width: 30,
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton(
              value: controller.selectedAsset.value,
              items: controller.assets.map((asset) {
                return DropdownMenuItem<String>(
                    value: asset,
                    child: Text(
                      asset,
                    ));
                }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  controller.selectedAsset.value = newValue;
                }
              }),
              TextField(
                onChanged: (value) {
                  if (value != null) {
                    controller.assetValue.value = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary
              ),
              child: InkWell(
                onTap: () {
                  AssetsController assetsController = Get.find();
                  assetsController.addTrackedAsset(
                      controller.selectedAsset.value,
                      controller.assetValue.value);
                  
                  Get.back(closeOverlays: true);
                },
                child: Text(
                    "Add Asset",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
