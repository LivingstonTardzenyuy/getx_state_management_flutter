import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx/pages/home.dart';
import 'package:getx/utils.dart';
import 'package:google_fonts/google_fonts.dart';

void main()  async{
  await registerServices;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.green),
        textTheme: GoogleFonts.quicksandTextTheme()
      ),
      routes: {
        "/home": (context) => HomePage()
    },
    initialRoute: "/home",
      // home: const HomePage(),
    );
  }
}
