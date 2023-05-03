import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testando/app/views/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller.emailEC,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextFormField(
            controller: controller.passwordEC,
            decoration: const InputDecoration(hintText: 'Senha'),
          ),
          ElevatedButton(
            onPressed: () {
              //controller.registerUser();
              Get.toNamed('/home');
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
