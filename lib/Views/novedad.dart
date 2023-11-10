import 'package:busrefactori/Views/principal.dart';
import 'package:busrefactori/services/ApiService.dart';
import 'package:flutter/material.dart';

class NovedadScreen extends StatelessWidget {
  const NovedadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FORMULARIO',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FormularioContainer(),
    );
  }
}

class FormularioContainer extends StatefulWidget {
  const FormularioContainer({super.key});

  @override
  State<FormularioContainer> createState() => _FormularioContainerState();
}

class _FormularioContainerState extends State<FormularioContainer> {
  final controllerPiloto = TextEditingController();
  final controllerPlaca = TextEditingController();
  final controllerFalla = TextEditingController();
  final controllerDescripcion = TextEditingController();
  final controllerDetalle = TextEditingController();

  @override
  void dispose() {
    controllerPiloto.dispose();
    controllerPlaca.dispose();
    controllerFalla.dispose();
    controllerDescripcion.dispose();
    controllerDetalle.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: controllerPiloto,
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
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerPlaca,
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
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerFalla,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Código de falla',
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerDescripcion,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción ',
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 8,
                controller: controllerDetalle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Detalle',
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 243, 33, 33),
                ),
              ),
              // const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 19, horizontal: 150),
                child: ElevatedButton(
                  onPressed: () async {
                    await senda();
                  },
                  child: Text('ENVIARaaaa'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> senda() async {
    ApiService apiService = ApiService();
    print('ss${controllerPiloto.text}');
    Map<String, dynamic> dato = {
      "procedure":
          "{ CALL busrefactori.SP_BUSREFACTORI_GUARDAR_NOVEDAD(?,?,?,?,?) }",
      "params": [
        controllerPiloto.text,
        controllerPlaca.text,
        controllerFalla.text,
        controllerDescripcion.text,
        controllerDetalle.text,
      ]
    };

    
    dynamic res = await apiService.guardarNovedad(dato);
    if (res != null){
      
    }
  }
}
