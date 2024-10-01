// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foto/controller/controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Controller _controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Câmera e Salvamento de Foto'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // para exibir a imagem tirada
          _controller.image != null
              ? Image.file(_controller.image!)
              : Placeholder(
                  fallbackHeight: 200,
                  fallbackWidth: double.infinity,
                ),
          SizedBox(height: 20),
          // botao para abrir a camera
          ElevatedButton.icon(
            onPressed: () async { // para abrir a camera
              await _controller.abrirCamera(); // atualizar para mostrar a foto
              setState(() {}); 
            },
            icon: Icon(Icons.camera_alt), //icone de camera
            label: Text('Abrir Câmera'), // texto do botao
          ),
          SizedBox(height: 10),
          // botao para salvar a foto
          ElevatedButton.icon(
            onPressed: () async {
              await _controller.salvarFoto(); // para salvar a foto
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Foto salva com sucesso!')),
              );
            },
            icon: Icon(Icons.save), // icone para salvar
            label: Text('Salvar Foto'), // texto do botao
          ),
        ],
      ),
    );
  }
}
