import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailEC = TextEditingController();

  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEC.text, password: passwordEC.text);
    Get.offAllNamed('/home');
  }
}
