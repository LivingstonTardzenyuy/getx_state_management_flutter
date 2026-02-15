import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/services/http_service.dart';



class AddAssetDialogController extends GetxController{
  RxBool loading = false.obs;
  
  @override
  void onInit() {
    // TODO: implement onInit
      super.onInit();
      _getAssets();
    }

    Future<void> _getAssets() async {
      loading = true as RxBool;
      HttpService httpService = Get.find();
      var response = await httpService.get("currencies");
      print(response.data);
      loading.value = false;

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
