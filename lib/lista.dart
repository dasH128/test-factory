import 'package:flutter/material.dart';
import 'package:busrefactori/NavDrawer.dart';

class lista extends StatelessWidget {
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
        title: Text("Mi Formulario"),
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
              labelText: 'Numero de Bus ',
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
              labelText: 'Presión de Gas (Antes)',
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
              labelText: 'Presion de Gas (Despues)',
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
              labelText: 'Estado de carroceria exterior',
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
              labelText: 'Salon (Interior)',
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
              labelText: 'Observacion',
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
