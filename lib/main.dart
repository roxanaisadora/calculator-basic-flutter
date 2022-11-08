import 'package:flutter/material.dart';
import 'dart:math';

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
      title: 'Sesion 05',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 233, 230, 230),
      ),
      home: const MyHomePage(title: 'Aplicacion Calculadora'),
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
  String _captura = "";
  String signo = "";
  String reset = "";
  // ignore: prefer_final_fields
  String _matisa = "";
  int char = 0;
  double char2 = 0;
  double nume1 = 0;
  double nume2 = 0;
  double resultado = 0;

  void _borrar() {
    setState(() {
      _captura = "";
      _matisa = "";
      nume2 = 0;
      nume1 = 0;
      signo = "";
    });
  }

  void _borrar2() {
    setState(() {
      if (_captura == "") {
        _captura = "";
        _matisa = '';
      } else {
        if (signo == '=') {
          _captura = _captura;
        } else {
          _captura = _captura.substring(0, _captura.length - 1);
          if (_captura.isEmpty) {
            _captura = '';
          }
        }
      }
    });
  }

  void _posinega() {
    setState(() {
      if (_captura == "") {
        _captura = "0";
        signo = '=';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          nume1 = -nume1;
          char = nume1.toInt();
          _captura = '$char';
        } else {
          nume1 = -nume1;
          _captura = '$nume1';
        }
      }
    });
  }

  void _sumar() {
    setState(() {
      if (_captura == "") {
        _captura = "";
        nume1 = 0;
        _matisa = '$nume1 +';
        signo = '+';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          _captura = '';
          char = nume1.toInt();
          _matisa = '$char +';
          signo = '+';
        } else {
          _captura = '';
          _matisa = '$nume1 +';
          signo = '+';
        }
      }
    });
  }

  void _resta() {
    setState(() {
      if (_captura == "") {
        _captura = "";
        nume1 = 0;
        _matisa = '$nume1 -';
        signo = '-';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          _captura = '';
          char = nume1.toInt();
          _matisa = '$char -';
          signo = '-';
        } else {
          _captura = '';
          _matisa = '$nume1 -';
          signo = '-';
        }
      }
    });
  }

  void _raiz() {
    setState(() {
      if (_captura == "") {
        _captura = "0";
        _matisa = '0';
        signo = '=';
      } else {
        nume1 = double.parse(_captura);
        _captura = '';
        _matisa = '√$nume1 =';
        signo = '~';
      }
    });
  }

  void _division() {
    setState(() {
      if (_captura == "") {
        _captura = "";
        nume1 = 0;
        _matisa = '$nume1 /';
        signo = '/';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          _captura = '';
          char = nume1.toInt();
          _matisa = '$char /';
          signo = '/';
        } else {
          _captura = '';
          _matisa = '$nume1 /';
          signo = '/';
        }
      }
    });
  }

  void _division2() {
    setState(() {
      if (_captura == "") {
        _matisa = "No se puede divir entre cero";
        _captura = "";
        signo = '=';
      } else {
        nume1 = double.parse(_captura);
        _captura = '';
        _matisa = '1 / $nume1';
        signo = '1/';
      }
    });
  }

  void _multiplicacion() {
    setState(() {
      if (_captura == "") {
        _captura = "";
        nume1 = 0;
        _matisa = '$nume1 x';
        signo = '*';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          _captura = '';
          char = nume1.toInt();
          _matisa = '$char x';
          signo = '*';
        } else {
          _captura = '';
          _matisa = '$nume1 x';
          signo = '*';
        }
      }
    });
  }

  void _cuadrado() {
    setState(() {
      if (_captura == "") {
        _captura = "0";
        _matisa = '0';
        signo = '=';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          _captura = '';
          char = nume1.toInt();
          _matisa = '$char² =';
          signo = '^';
        } else {
          _captura = '';
          _matisa = '$nume1² =';
          signo = '^';
        }
      }
    });
  }

  void _porcentaje() {
    setState(() {
      if (_captura == "") {
        _matisa = '0';
        _captura = "";
        signo = '=';
      } else {
        nume1 = double.parse(_captura);
        if ((nume1 % 1) == 0) {
          _captura = '';
          char = nume1.toInt();
          _matisa = '$char % =';
          signo = '%';
        } else {
          _captura = '';
          _matisa = '$nume1 % =';
          signo = '%';
        }
      }
    });
  }

  void _respuesta() {
    setState(() {
      if (signo == "") {
        _captura = _captura;
        signo = '=';
      } else if (signo == '^') {
        if ((nume1 % 1) == 0) {
          char = nume1.toInt();
          _captura = ((pow(char, 2))).toString();
          signo = '=';
          nume1 = double.parse(_captura);
        } else {
          _captura = ((pow(nume1, 2))).toString();
          nume1 = double.parse(_captura);
          signo = '=';
        }
      } else if (signo == '~') {
        if ((nume1 % 1) == 0) {
          char = nume1.toInt();
          _captura = ((pow(char, 0.5))).toString();
          signo = '=';
          nume1 = double.parse(_captura);
        } else {
          _captura = ((pow(nume1, 0.5))).toString();
          nume1 = double.parse(_captura);
          signo = '=';
        }
      } else if (signo == '%') {
        if ((nume1 % 1) == 0) {
          char = nume1.toInt();
          _captura = (char / 100).toString();
          signo = '=';
          nume1 = double.parse(_captura);
        } else {
          _captura = (nume1 / 100).toString();
          nume1 = double.parse(_captura);
          signo = '=';
        }
      } else if (signo == '1/') {
        _captura = (1 / nume1).toString();
        nume1 = double.parse(_captura);
        signo = '=';
      } else if (_captura == "") {
        _captura = '0';
        signo = '=';
      } else if (signo != "") {
        nume2 = double.parse(_captura);

        if (signo == '+') {
          _matisa = '$nume1 + $nume2 =';
          char2 = nume1 + nume2;
          if ((char2 % 1) == 0) {
            char = char2.toInt();
            _captura = '$char';
            nume1 = double.parse(_captura);
            signo = '=';
          } else {
            _captura = '$char2';
            nume1 = char2;
            signo = '=';
          }
        }
        if (signo == '-') {
          _matisa = '$nume1 + $nume2 =';
          char2 = nume1 - nume2;
          if ((char2 % 1) == 0) {
            char = char2.toInt();
            _captura = '$char';
            signo = '=';
            nume1 = double.parse(_captura);
          } else {
            _captura = '$char2';
            nume1 = char2;
            signo = '=';
          }
        }
        if (signo == '*') {
          _matisa = '$nume1 x $nume2 =';
          char2 = nume1 * nume2;
          if ((char2 % 1) == 0) {
            char = char2.toInt();
            _captura = '$char';
            signo = '=';
            nume1 = double.parse(_captura);
          } else {
            _captura = '$char2';
            nume1 = char2;
            signo = '=';
          }
        }
        if (signo == '/') {
          _matisa = '$nume1 ÷ $nume2 =';
          char2 = nume1 / nume2;
          if ((char2 % 1) == 0) {
            char = char2.toInt();
            _captura = '$char';
            signo = '=';
            nume1 = double.parse(_captura);
          } else {
            _captura = '$char2';
            nume1 = char2;
            signo = '=';
          }
        }
        if (signo == '=') {
          _captura = _captura;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.calculate),
          tooltip: 'calculadora',
        ),
        title: SizedBox(
          // //alignment: Alignment.center,
          // height: 50,
          width: 250,
          child: Image.network(
              'https://mir-s3-cdn-cf.behance.net/projects/404/c697f587154819.Y3JvcCwxMzc2LDEwNzcsMjY1LDA.png'),
        ),
        actions: [
          SizedBox(
            width: 50,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV_PD-jVgVMizI7O-128DiJMKu7KRbJzSyWn42zHBj-Ujn5J579kVM7Ac5Wq54rHxkCHc&usqp=CAU'),
          )
        ],
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            SizedBox(
              width: 350,
              child: Text(
                _matisa,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Text(
              //'$_counter',
              _captura,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              //Use of SizedBox
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    backgroundColor: Colors.grey,
                    onPressed: _porcentaje,
                    tooltip: 'porcentaje',
                    child: const Text('%',
                        style: TextStyle(color: Colors.white, fontSize: 25))),
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.grey,
                  onPressed: _borrar,
                  child: const Text('CE',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.grey,
                  onPressed: _borrar,
                  child: const Text('C',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.grey,
                    onPressed: _borrar2,
                    tooltip: 'borrar',
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.redAccent,
                  onPressed: _division2,
                  child: const Text('1/x',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.redAccent,
                  onPressed: _cuadrado,
                  child: const Text('X²',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.redAccent,
                  onPressed: _raiz,
                  child: const Text('√',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 94, 238, 169),
                    onPressed: _division,
                    tooltip: 'division',
                    child: const Text('÷',
                        style: TextStyle(color: Colors.white, fontSize: 25))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('7',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "7";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "7";
                        }
                      });
                    }),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('8',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "8";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "8";
                        }
                      });
                    }),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('9',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "9";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "9";
                        }
                      });
                    }),
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 94, 238, 169),
                  onPressed: _multiplicacion,
                  tooltip: 'multiplicar',
                  child: const Text('X',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('4',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "4";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "4";
                        }
                      });
                    }),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('5',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "5";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "5";
                        }
                      });
                    }),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('6',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "6";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "6";
                        }
                      });
                    }),
                FloatingActionButton(
                  backgroundColor: Colors.greenAccent,
                  onPressed: _resta,
                  tooltip: 'restar',
                  child: const Text('-',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('1',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "1";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "1";
                        }
                      });
                    }),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('2',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "2";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "2";
                        }
                      });
                    }),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('3',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "3";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "3";
                        }
                      });
                    }),
                FloatingActionButton(
                  backgroundColor: Colors.greenAccent,
                  onPressed: _sumar,
                  tooltip: 'sumar',
                  child: const Text('+',
                      style: TextStyle(color: Colors.white, fontSize: 28)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.redAccent,
                  onPressed: _posinega,
                  child: const Text('+/-',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                MaterialButton(
                    minWidth: 75.0,
                    height: 55.0,
                    color: Colors.white,
                    child: const Text('0',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    onPressed: () {
                      setState(() {
                        _captura += "0";
                        if (signo == '=') {
                          _captura = "";
                          signo = '';
                          _captura += "0";
                        }
                      });
                    }),
                MaterialButton(
                  minWidth: 75.0,
                  height: 55.0,
                  color: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      if (_captura == "") {
                        _captura = "0.";
                      } else {
                        char2 = double.parse(_captura);
                        if ((char2 % 1) == 0) {
                          char = int.parse(_captura);
                          _captura = '$char.';
                          signo = '';
                        } else {
                          _captura = '$char2';
                          signo = '';
                        }
                      }
                    });
                  },
                  child: const Text('.',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.greenAccent,
                  onPressed: _respuesta,
                  tooltip: 'igual',
                  child: const Text('=',
                      style: TextStyle(color: Colors.white, fontSize: 23)),
                )
              ],
            ),
            const SizedBox(
              //Use of SizedBox
              height: 20,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
