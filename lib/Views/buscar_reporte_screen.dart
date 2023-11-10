import 'dart:io';

import 'package:busrefactori/Views/buscar_resultado_reporte_screen.dart';
import 'package:busrefactori/widgets/input_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class BuscarReporteScreen extends StatefulWidget {
  const BuscarReporteScreen({super.key});

  @override
  State<BuscarReporteScreen> createState() => _BuscarReporteScreenState();
}

class _BuscarReporteScreenState extends State<BuscarReporteScreen> {
  TextEditingController controllerDate1 = TextEditingController();
  TextEditingController controllerDate2 = TextEditingController();
  TextEditingController controllerTipo = TextEditingController();
  DateTime? dateInit;
  DateTime? dateEnd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controllerDate1.dispose();
    controllerDate2.dispose();
    controllerTipo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listas reporte'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 140,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          // width: 15,
                          // height: 250,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text('INFOBUS', style: TextStyle(fontSize: 36)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              height: 60,
              child: InputDateWidget(
                suffixIcon: const Icon(Icons.calendar_month),
                controller: controllerDate1,
                labelText: 'Fecha inicial',
                // hintText: 'sss',
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 1, 1),
                    lastDate: DateTime.now(),
                  );
                  if (date == null) return;
                  dateInit = date;
                  controllerDate1.text =
                      '${date.day}/${date.month}/${date.year}';
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 60,
              child: InputDateWidget(
                suffixIcon: const Icon(Icons.calendar_month),
                controller: controllerDate2,
                labelText: 'Fecha final',
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 1, 1),
                    lastDate: DateTime.now(),
                  );
                  if (date == null) return;
                  dateEnd = date;
                  controllerDate2.text =
                      '${date.day}/${date.month}/${date.year}';
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 60,
              child: InputDateWidget(
                suffixIcon: null,
                controller: controllerTipo,
                labelText: 'Tipo de reporte',
                onTap: () async {
                  var data = await showDialog<String?>(
                    context: context,
                    builder: (_) => const SelectTipoInformeView(
                      items: [
                        'Novedad en via',
                        'Lista de chequeo',
                        'Inspección nocturna'
                      ],
                    ),
                  );
                  if (data == null) return;
                  controllerTipo.text = data;
                  setState(() {});
                },
              ),
            ),
            Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (dateInit == null ||
                        dateEnd == null ||
                        controllerTipo.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Ingrese todos los campos',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          BuscarResultadoReporteScreen(
                        // fecha1: controllerDate1.text,
                        fecha1:
                            '${dateInit!.year}-${dateInit!.month}-${dateInit!.day}',
                        // fecha2: controllerDate2.text,
                        fecha2:
                            '${dateEnd!.year}-${dateEnd!.month}-${dateEnd!.day}',
                        informeTipo: controllerTipo.text,
                      ),
                    ));
                  },
                  child: const Text('Buscar'),
                )),
          ],
        ),
      ),
    );
  }

  Future downloadPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );
    final file = File('example.pdf');
    // var p = pdf.save();
    await file.writeAsBytes(await pdf.save());
  }
}

class SelectTipoInformeView extends StatelessWidget {
  final List<String> items;
  const SelectTipoInformeView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Seleccione un reporte'),
      children: [
        ...items
            .map((item) => SimpleDialogOption(
                  onPressed: () => Navigator.of(context).pop(item),
                  child: Text(item),
                ))
            .toList(),
      ],
    );
  }
}
