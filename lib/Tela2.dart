import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Segunda Tela")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Voltar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
