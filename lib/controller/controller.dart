import 'dart:io';
import 'package:foto/model/model.dart';
import 'package:image_picker/image_picker.dart';

class Controller {
  File? image; // para armazena a foto
  final ImagePicker _picker = ImagePicker(); // para capturar a foto
  final Model _model = Model(); // para salvar a foto
  bool _isPicking = false; // para verificar a foto

  // funcao para abrir a camera e tirar a foto
  Future<void> abrirCamera() async {
    if (_isPicking) return; // impede que abra a camera novamente 
    _isPicking = true; // para verificar se a camera está aberta
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path); // para guarda a foto tirada
      }
    } finally {
      _isPicking = false; // libera a camera para ser usada novamente
    }
  }

  // funcao para salvar a foto 
  Future<void> salvarFoto() async {
    if (image != null) {
      await _model.salvarImagem(image!); // pede ao model para salvar a foto
    }
  }
}
