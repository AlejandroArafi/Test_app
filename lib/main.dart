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
  bool _showQuestion = false;
  bool _showAnswerButtons = false;

  List<String>? _preguntasActuales;

  final List<String> _preguntasPaises = [
    '¿la capital de Francia es Paris?',
    '¿Japón se encuentra en asia?',
    '¿el gentilicio de Inglaterra es ingleses',
    '¿Islandia es una isla?',
    '¿New York es la capital de EEUU?'
  ];
  final List<String> _preguntasHistoria = [
    '¿La Revolución Francesa comenzó en 1789?',
    '¿La Gran Muralla China fue construida inicialmente para repeler invasiones de dinosaurios?',
    '¿Leonardo Da Vinci pintó la "Última Cena" en el siglo XV?',
    '¿La Primera Guerra Mundial comenzó en 1914?',
    '¿El Imperio Romano cayó en el año 476 d.C.?'
  ];

  final List<String> _preguntasDeportes = [
    '¿El baloncesto fue inventado en 1891?',
    '¿El futbol es el deporte más popular del mundo?',
    '¿El balonmano es un deporte de equipo?',
    '¿El golf se juega con una pelota pequeña?',
    '¿El tenis se juega con una raqueta y una pelota?'
  ];

  void _siguientePregunta() {
    setState(() {
      _preguntaActual =
          _preguntasActuales![Random().nextInt(_preguntasActuales!.length)];
    });
  }

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

                //paises
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _preguntasActuales = _preguntasPaises;
                          _preguntaActual = _preguntasActuales![
                              Random().nextInt(_preguntasActuales!.length)];
                          _showButtons = false;
                          _showQuestion = true; // Muestra la pregunta
                        });
                      },
                      child: const Text(
                        'Paises',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    //historia
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _preguntasActuales = _preguntasHistoria;
                          _preguntaActual = _preguntasHistoria![
                              Random().nextInt(_preguntasHistoria!.length)];
                          _showButtons = false;
                          _showQuestion = true;
                        });
                      },
                      child: const Text(
                        'Historia',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    //deportes
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _preguntasActuales = _preguntasDeportes;
                          _preguntaActual = _preguntasDeportes[
                              Random().nextInt(_preguntasDeportes.length)];
                          _showButtons = false;
                          _showQuestion = true;
                          _showAnswerButtons = true;
                        });
                      },
                      child: const Text(
                        'Deportes',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              if (_showQuestion) Text(_preguntaActual!),
              if (_showQuestion)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _siguientePregunta,
                      child: const Text('verdadero'), //boton verdadero
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _siguientePregunta,
                      child: const Text('falso'), //boton falso
                    ),
                  ],
                ),
              if ((_showQuestion || !_showButtons) && _preguntaActual != null)
                SizedBox(height: 20),
              if ((_showQuestion || !_showButtons) && _preguntaActual != null)
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showButtons = false;
                        _showQuestion = false;
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
