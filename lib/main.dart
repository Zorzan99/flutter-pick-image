import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testando/app/views/home_page/home_route.dart';
import 'package:testando/app/views/login/login_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PickImage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        ...LoginRoute().routers,
        ...HomeRoute().routers,
      ],
    );
  }
}
