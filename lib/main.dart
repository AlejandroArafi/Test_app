import 'dart:math';

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
  bool _showQuestion =
      false; // Añadida para controlar la visibilidad de la pregunta

  final List<String> _preguntas = [
    '¿Cuál es la capital de Francia?',
    '¿Quién escribió La Odisea?',
    '¿Qué gas es esencial para la respiración de los seres humanos?',
    '¿Cuál es el río más largo del mundo?',
    '¿En qué año llegó el hombre a la Luna?'
  ];

  String? _preguntaActual;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("Quiz app"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (!_showButtons && !_showQuestion) // Mostrar solo al inicio
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showButtons = true;
                    });
                  },
                  child: const Text(
                    'Comenzar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              if (_showButtons)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _preguntaActual =
                          _preguntas[Random().nextInt(_preguntas.length)];
                      _showButtons = false;
                      _showQuestion = true; // Muestra la pregunta
                    });
                  },
                  child: const Text(
                    'Música',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              if (_showQuestion) // Asegurarse de que la pregunta se muestra cuando se debe
                Text(_preguntaActual!),
              if ((_showQuestion || !_showButtons) &&
                  _preguntaActual !=
                      null) // El botón regresar se muestra cuando está la pregunta o no hay botones.
                SizedBox(height: 20),
              if ((_showQuestion || !_showButtons) &&
                  _preguntaActual !=
                      null) // Ajustado para mostrar en las condiciones correctas
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showButtons = false;
                        _showQuestion =
                            false; // Restablece para no mostrar la pregunta
                        _preguntaActual = null;
                      });
                    },
                    child: const Text('Regresar'))
            ],
          ),
        ),
      ),
    );
  }
}
