import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  // Step 2
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Estudiantes'),
    );
  }
}

List<Widget>generador(){

  dynamic jsonExcelente =
  {
    "resultado": "ok",
    "items": [
      {
        "imagen": "1",
        "nombre": "Jossyr Pinto",
        "carrera": "Ing Sistemas",
        "promedio": 4.0,
      },
      {
        "imagen": "2",
        "nombre": "Estefany Rueda",
        "carrera": "Ing Sistemas",
        "promedio": 4.5,
      },
      {

        "imagen": "3",
        "nombre": "Audo Ali Diaz",
        "carrera": "Admon BBDD",
        "promedio": 4.9,
      },
      {
        "imagen": "1",
        "nombre": "Jossyr Pinto",
        "carrera": "Ing Sistemas",
        "promedio": 4.0,
      },
      {
        "imagen": "2",
        "nombre": "Estefany Rueda",
        "carrera": "Ing Sistemas",
        "promedio": 4.5,
      },
      {

        "imagen": "3",
        "nombre": "Audo Ali Diaz",
        "carrera": "Admon BBDD",
        "promedio": 4.9,
      }
    ]
  }
  ;
  dynamic elementos = jsonExcelente["items"];
  List<Widget> listaWidgets = <Widget>[];
  for (int i = 0; i < elementos.length; i ++){
    dynamic oItem = elementos[i];
    listaWidgets.add(
        buttonStyle(oItem["imagen"], oItem["nombre"], oItem["carrera"], oItem["promedio"])
    );
  }
  return listaWidgets;
}
class buttonStyle extends StatelessWidget {
  final String fotico;
  final String nombre;
  final String carrera;
  final double promedio;


  buttonStyle(this.fotico, this.nombre, this.carrera, this.promedio);


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print('Hola');
          },
        child: new Container(
          margin: new EdgeInsets.fromLTRB(10,10,10,10),
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              color: Colors.white24),
          child: new Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(19),
                child: Image(
                  image: AssetImage('assets/$fotico.jpg'), //pubspec.yaml > assets: - assets/
                  height:120,
                  width:120,
                ),
              ),new Column(
                children: [new Container(
                  margin: new EdgeInsets.fromLTRB(20,35,10,10),
                  child:new Column(
                    children: [new Text(
                      nombre,
                      style: new TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                      new Text(
                        carrera,
                        style: new TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      new Text(
                        promedio.toString(),
                        style: new TextStyle(color: Colors.white, fontSize: 19.0),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ]
            ,
          ),
        ));
  }



}
class MyHomePage extends StatefulWidget {

  String listica(){
    return '';
  }
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        color:Colors.blue,
        child:ListView(
          children:
            generador()
            //buttonStyle('1','Pedro','Ing Sistemas e Informatica',4.0)
          ,
        )

      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
