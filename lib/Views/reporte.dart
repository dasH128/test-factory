// ignore_for_file: prefer_const_constructors

import 'package:busrefactori/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:busrefactori/Views/principal.dart';

class reporte extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REPORTES',
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

class _formularioState extends State<formulario> {
  final piloto = TextEditingController();
  final placabus = TextEditingController();
  final detalle = TextEditingController();
  final ubicacion = TextEditingController();
  final hora = TextEditingController();
  final sistema = TextEditingController();
  final velocidad = TextEditingController();

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
            controller: piloto,
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
            controller: placabus,
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
            controller: ubicacion,
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
            controller: hora,
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
            controller: sistema,
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
            controller: velocidad,
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
            controller: detalle,
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
            child: ElevatedButton(
              onPressed: send,
              child: Text('ENVIAR'),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> send() async {
    ApiService apiService = ApiService();
    Map<String, dynamic> dato = {
      "procedure": "{ CALL busrefactori.SP_BUSREFACTORI_GUARDAR_REPORTE(?,?,?,?,?,?,?) }",
      "params": [piloto.text,placabus.text,detalle.text,ubicacion.text,hora.text,sistema.text,velocidad.text],
    };

    dynamic res = await apiService.guardarReporte(dato);
    print(res);
    if (res != null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('REPORTE'),
                content: const Text('REPORTE ENVIADO'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Aceptar'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyAppi()));
                    },
                  )
                ],
              ));
    }
  }
}
