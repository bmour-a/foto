import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Model {
  // Função para salvar a imagem 
  Future<void> salvarImagem(File image) async { // funcao para salvar uma imagem
    final directory = await getApplicationDocumentsDirectory();
    final fileName = basename(image.path); // para pegar o nome da foto
    final savedImage = File('${directory.path}/$fileName'); // cria um arquivo para a foto
    await image.copy(savedImage.path);
  }
}
