import 'package:busrefactori/services/ApiService.dart';
import 'package:busrefactori/widgets/input_date_widget.dart';
import 'package:busrefactori/widgets/select_bus_widget.dart';
import 'package:flutter/material.dart';
import 'package:busrefactori/Views/principal.dart';

class lista extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FORMULARIO',
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
  final piloto = TextEditingController();
  final placabus = TextEditingController();
  final gas_antes = TextEditingController();
  final gas_despues = TextEditingController();
  final estado = TextEditingController();
  final salon = TextEditingController();
  final observacion = TextEditingController();
  final controllerDate = TextEditingController();
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
            const SizedBox(height: 16),
            TextFormField(
              controller: placabus,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Numero de Bus ',
              ),
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.w800,
              ),
              onTap: () async {
                var data = await showDialog<String?>(
                  context: context,
                  builder: (_) {
                    return const SelectPlacaBusView();
                  },
                );
                if (data == null) return;
                print('eligio $data');
                placabus.text = data;
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: gas_antes,
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
            const SizedBox(height: 16),
            TextFormField(
              controller: gas_despues,
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
            const SizedBox(height: 16),
            TextFormField(
              controller: estado,
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
            const SizedBox(height: 16),
            TextFormField(
              controller: salon,
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

                controllerDate.text = '${date.year}-${date.month}-${date.day}';
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 8,
              controller: observacion,
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
              child: ElevatedButton(
                onPressed: send,
                child: Text('ENVIAR'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> send() async {
    ApiService apiService = ApiService();
    Map<String, dynamic> dato = {
      "procedure":
          "{ CALL busrefactori.SP_BUSREFACTORI_GUARDAR_CHECK(?,?,?,?,?,?,?, ?) }",
      "params": [
        piloto.text,
        placabus.text,
        gas_antes.text,
        gas_despues.text,
        estado.text,
        salon.text,
        observacion.text,
        controllerDate.text
      ]
    };

    dynamic res = await apiService.guardarCheck(dato);
    if (res != null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('CHEQUEO'),
                content: const Text('CHEQUEO ENVIADO'),
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
