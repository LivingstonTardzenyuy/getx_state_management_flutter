import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/assets_controller.dart';
import 'package:getx/widgets/add_dialog.dart';

class HomePage extends StatelessWidget {
  AssetsController assetsController = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
      body: _buildUI(context)

    );
  }


  Widget _buildUI(BuildContext context) {
    return SafeArea(
        child: Obx (
            () => Column(
              children: [
                _portfolioValue(context),
              ],
            )
        )
    );
  }

  Widget _portfolioValue(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child:
          // ),
          Text.rich(
              TextSpan(
                  children: [
                    const TextSpan(
                        text: "\$",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500
                        )
                    ),

                    TextSpan(
                      text: "${assetsController.getPortfolioValue().toStringAsFixed(2)}\n",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.w700
                      ),
                    ),

                    const TextSpan(
                        text: "Portfolio value",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w200
                        )
                    )
                  ]
              )
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.yellow,
          ),
          child: IconButton(
            color: Colors.yellow ,
              onPressed: () {
                Get.dialog(AddAssetDialog());
              },
              icon: Icon(Icons.add, color: Colors.black, fontWeight: FontWeight.w600,)
          ),
        ),
      ],
    );
  }
}
