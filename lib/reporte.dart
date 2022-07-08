import 'package:flutter/material.dart';
import 'package:busrefactori/NavDrawer.dart';

class reporte extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: formulario(),
    );
  }
}

class formulario extends StatefulWidget {
  formulario({Key? key}) : super(key: key);

  @override
  State<formulario> createState() => _formularioState();
}

String dropDownValue = "Hombre";
var sexo = [
  'Hombre',
  'Mujer',
];

int _value = 0;

class _formularioState extends State<formulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyAppi()));
              },
              icon: Icon(Icons.reply))
        ],
        title: Text("FORMULARIO DE FALLAS Y VARADAS"),
      ),
      body: Center(
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre del piloto',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Placa del bus',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ubicacion del evento',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Hora',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Sistema',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Velocidad que presento la falla',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextFormField(
            maxLines: 8,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingrese el detalle de la novedad',
            ),
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 243, 33, 33),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 19, horizontal: 150),
            child: RaisedButton(
              onPressed: () {},
              child: Text('ENVIAR'),
            ),
          ),
        ]),
      ),
    );
  }
}
