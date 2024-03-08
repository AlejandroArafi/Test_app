import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _showButtons = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("Quiz app"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (!_showButtons)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showButtons = true;
                    });
                  },
                  child: Text(
                    'comenzar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              if (_showButtons) ...[
                ElevatedButton(
                  onPressed: () {},
                  child: Text('boton 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción para el botón 2
                  },
                  child: Text('Botón 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción para el botón 3
                  },
                  child: Text('Botón 3'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showButtons = false;
                      });
                    },
                    child: Text('Regresar'))
              ],
            ],
          ),
        ),
      ),
    );
  }
}
