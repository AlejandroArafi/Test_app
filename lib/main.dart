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
  //bool _showAnswerButtons = false;
  int _preguntasMostradas = 0;
  int _puntaje = 0;
  List<bool> _respuestasActuales = [];
  List<String>? _preguntasActuales;
  String? _preguntaActual;

  final List<String> _preguntasPaises = [
    '¿la capital de Francia es Lyon?',
    '¿Japón se encuentra en asia?',
    '¿el gentilicio de Inglaterra es ingleses',
    '¿Islandia es una isla?',
    '¿New York es la capital de EEUU?'
  ];
  final List<String> _preguntasHistoria = [
    '¿La Revolución Francesa comenzó en 1789?',
    '¿La mona lisa es una famosa pintura de Leonardo Da Vinci?',
    '¿Leonardo Da Vinci pintó la "Última Cena" en el siglo XV?',
    '¿La Primera Guerra Mundial comenzó en 1914?',
    '¿El Imperio Romano cayó en el año 476 d.C.?'
  ];

  final List<String> _preguntasDeportes = [
    '¿El baloncesto fue inventado en 1891?',
    '¿El futbol es el deporte más popular del mundo?',
    '¿El balonmano es un deporte de equipo?',
    '¿El golf se juega con una pelota cuadrada?',
    '¿El tenis se juega con una raqueta y una pelota?'
  ];

  final List<bool> _respuestasPaises = [
    false,
    true,
    true,
    true,
    false,
  ];

  final List<bool> _respuestasHistoria = [
    true,
    true,
    false,
    true,
    true,
  ];

  final List<bool> _respuestasDeportes = [
    true,
    true,
    true,
    false,
    true,
  ];

  void _siguientePregunta() {
    if (_preguntasMostradas + 1 < _preguntasActuales!.length) {
      setState(() {
        _preguntasMostradas++;
        _preguntaActual = _preguntasActuales![_preguntasMostradas];
      });
    } else {
      setState(() {
        _showQuestion = false;
        _showButtons = false; // Añade esta línea
      });
    }
  }

  void _manejarRespuesta(bool respuestaUsuario) {
    //int indicePreguntaActual = _preguntasActuales!.indexOf(_preguntaActual!);
    //bool respuestaCorrecta = _respuestasActuales[indicePreguntaActual];

    if (respuestaUsuario == _respuestasActuales[_preguntasMostradas]) {
      //setState(() {
      _puntaje++;
      //});
    }
    _siguientePregunta();
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
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
                Column(
                  children: [
                    _categoriaButton(
                        'Países', _preguntasPaises, _respuestasPaises),
                    _categoriaButton(
                        'Historia', _preguntasHistoria, _respuestasHistoria),
                    _categoriaButton(
                        'Deportes', _preguntasDeportes, _respuestasDeportes),
                  ],
                ),
              if (_showQuestion) Text(_preguntaActual!),
              if (_showQuestion)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _manejarRespuesta(true),
                      child: const Text('Verdadero'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _manejarRespuesta(false),
                      child: const Text('Falso'),
                    ),
                  ],
                ),
              if (!_showQuestion && !_showButtons && _preguntasActuales != null)
                Column(
                  children: [
                    Text('¡Cuestionario completado!'),
                    Text('Respuestas correctas: $_puntaje'),
                    Text(
                        'Respuestas incorrectas: ${_preguntasActuales!.length - _puntaje}'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _preguntasMostradas = 0;
                          _puntaje = 0;
                          _showButtons = true;
                          _preguntasActuales = null;
                        });
                      },
                      child: Text('Volver a jugar'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoriaButton(
      String categoria, List<String> preguntas, List<bool> respuestas) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _preguntasActuales = preguntas;
          _respuestasActuales = respuestas;
          _preguntaActual = preguntas.first;
          _showButtons = false;
          _showQuestion = true;
        });
      },
      child: Text(
        categoria,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
