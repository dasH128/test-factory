import 'package:busrefactori/Views/buscar_reporte_screen.dart';
import 'package:busrefactori/Views/principal.dart';
import 'package:busrefactori/services/ApiService.dart';
import 'package:busrefactori/widgets/input_date_widget.dart';
import 'package:busrefactori/widgets/select_bus_widget.dart';
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
  final controllerDate = TextEditingController();

  @override
  void dispose() {
    controllerPiloto.dispose();
    controllerPlaca.dispose();
    controllerFalla.dispose();
    controllerDescripcion.dispose();
    controllerDetalle.dispose();
    controllerDate.dispose();
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
              // TextFormField(
              //   controller: controllerPlaca,
              //   decoration:const  InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Numero de Bus ',
              //   ),
              //   style: const TextStyle(
              //     fontSize: 15,
              //     color: Colors.blue,
              //     fontWeight: FontWeight.w800,
              //   ),
              // ),
              TextFormField(
                controller: controllerPlaca,
                readOnly: true,
                onTap: () async {
                  var data = await showDialog<String?>(
                    context: context,
                    builder: (_) {
                      return const SelectPlacaBusView();
                    },
                  );
                  if (data == null) return;
                  print('eligio $data');
                  controllerPlaca.text = data;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero de Bus ',
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerFalla,
                decoration: const InputDecoration(
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
              InputDateWidget(
                padding: 0,
                suffixIcon: const Icon(Icons.calendar_month),
                controller: controllerDate,
                labelText: 'Fecha',
                // hintText: 'sss',
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 1, 1),
                    lastDate: DateTime.now(),
                  );
                  if (date == null) return;

                  controllerDate.text =
                      '${date.year}-${date.month}-${date.day}';
                  setState(() {});
                },
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
                padding: EdgeInsets.symmetric(vertical: 19, horizontal: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    await senda();
                  },
                  child: Text('ENVIAR'),
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
    print('ss${controllerDate.text}');
    Map<String, dynamic> dato = {
      "procedure":
          "{ CALL busrefactori.SP_BUSREFACTORI_GUARDAR_NOVEDAD(?,?,?,?,?,?) }",
      "params": [
        controllerPiloto.text,
        controllerPlaca.text,
        controllerFalla.text,
        controllerDescripcion.text,
        controllerDetalle.text,
        controllerDate.text
      ]
    };

    dynamic res = await apiService.guardarNovedad(dato);
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
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MyAppi()));
                    },
                  )
                ],
              ));
    }
  }
}
