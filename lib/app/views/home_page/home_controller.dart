import 'dart:io';

import 'package:document_detector/android/android_settings.dart';
import 'package:document_detector/document_detector.dart';
import 'package:document_detector/result/document_detector_failure.dart';
import 'package:document_detector/result/document_detector_result.dart';
import 'package:document_detector/result/document_detector_success.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final DocumentDetector _documentDetector =
      DocumentDetector(mobileToken: 'mobileToken');

  DocumentDetectorAndroidSettings androidSettings =
      DocumentDetectorAndroidSettings(
    useEmulator: true,
    useRoot: true,
    useDeveloperMode: true,
    useAdb: true,
    useDebug: true,
  );

  Future<void> pickImage({required bool isCamera}) async {
    final source = isCamera ? ImageSource.camera : ImageSource.gallery;
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      final imageFile = File(image.path);
      await validateDocument(imageFile);
    }
  }

  Future<void> validateDocument(File imageFile) async {
    try {
      // Realizar a validação do documento
      final result = await _documentDetector.start();

      // Processar o resultado da validação
      processValidationResult(result);
    } catch (e) {
      // Lidar com erros de forma adequada
      print('Erro ao validar o documento: $e');
    }
  }

  void processValidationResult(DocumentDetectorResult result) {
    // Aqui você pode implementar a lógica para processar o resultado da validação
    if (result is DocumentDetectorSuccess) {
      print('Documento válido!');
      // Acessar as fotos dos documentos capturadas: result.documentImages
    } else if (result is DocumentDetectorFailure) {
      print('Documento inválido.');
      print('Motivo: $result');
    } else {
      print('Validação do documento cancelada pelo usuário.');
    }
  }

  Future<String?> uploadPhotoToFirebaseStorage(File file) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('photos/$fileName');
      firebase_storage.UploadTask uploadTask = ref.putFile(file);
      firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Erro ao enviar foto para o Firebase Storage: $e');
      return null;
    }
  }

  Future<void> validateDocumentCNH() async {
    // Aqui você pode implementar a validação específica para a CNH
    // Por exemplo, mostrar uma mensagem informando que a validação da CNH está em andamento
    print('Validação da CNH em andamento...');
    // Chamar a função de validação geral
    await validateDocumentCNH();
  }
}
