import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testando/app/views/home_page/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Enviar documento'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Selecionar imagem'),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                controller.pickImage(isCamera: false);
                                Navigator.pop(context);
                              },
                              child: const Text('Abrir galeria'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.pickImage(isCamera: true);
                                Navigator.pop(context);
                              },
                              child: const Text('Abrir câmera'),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Chamar a função para validar o documento (no caso, CNH)
                controller.validateDocumentCNH();
              },
              child: const Text('Enviar CNH'),
            ),
          ],
        ),
      ),
    );
  }
}
