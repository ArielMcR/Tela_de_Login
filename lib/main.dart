import 'package:flutter/material.dart';
import 'package:flutter_application_4/Tela2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela de login',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 158, 155, 163)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tela de login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _usernameController = TextEditingController();
  final _senhaController = TextEditingController();

  void eventoCancelar() {
    _usernameController.clear();
    _senhaController.clear();
  }

  void eventoLogar() {
    String nome_usuario = _usernameController.text;
    String senha = _senhaController.text;

    if (nome_usuario == 'Ariel' && senha == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Tela2()),
      );
    } else {
      exibirJanelaErro(context);
    }
  }

  void exibirJanelaErro(BuildContext context) {
    Widget okbuton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("OK"));
    AlertDialog alert = AlertDialog(
      title: const Text("Erro"),
      content: const Text("Ocorreu algum problema tente novamente"),
      actions: [
        okbuton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(151, 35, 0, 44),
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              style: const TextStyle(
                color: Color.fromARGB(255, 39, 38, 38),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14.0,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.0),
              child: TextField(
                controller: _senhaController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: eventoCancelar, child: const Text("Cancelar")),
                ElevatedButton(
                    onPressed: eventoLogar, child: const Text("Logar"))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: const Text("Esqueceu a senha ?"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
