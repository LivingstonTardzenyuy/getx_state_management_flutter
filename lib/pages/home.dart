import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/add_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
      body: Center(
        child: Text("Ended in 00:53"),
      )

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
