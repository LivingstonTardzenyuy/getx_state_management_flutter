import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/api_response.dart';
import 'package:getx/services/http_service.dart';



class AddAssetDialogController extends GetxController{
  RxBool loading = false.obs;
  RxList<String> assets = <String>[].obs;
  RxList<dynamic> selectedAsset = [].obs;


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
            child: _buildUI(),
          ),
        ),
      )
    );
  }

  Widget _buildUI() {
    if (controller.loading.isTrue) {
      return const Center(
        child: SizedBox(
          height: 30, width: 30,
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("This is the loading state"),
          )
        ],
      );
    }
  }
}
