import 'dart:convert';
import 'dart:io';

import 'package:busrefactori/entities/report1.dart';
import 'package:busrefactori/entities/reporte_check.dart';
import 'package:busrefactori/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BuscarResultadoReporteScreen extends StatefulWidget {
  final String fecha1;
  final String fecha2;
  final String informeTipo;
  const BuscarResultadoReporteScreen({
    super.key,
    required this.fecha1,
    required this.fecha2,
    required this.informeTipo,
  });

  @override
  State<BuscarResultadoReporteScreen> createState() =>
      _BuscarResultadoReporteScreenState();
}

class _BuscarResultadoReporteScreenState
    extends State<BuscarResultadoReporteScreen> {
  bool isLoading = true;
  List<Reporte1> listaReporte1 = [];
  List<ReporteCheck> listaReporte2 = [];
  List<Reporte1> listaReporte3 = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    ApiService apiService = ApiService();
    print('${widget.fecha1} - ${widget.fecha2}');
    if (widget.informeTipo == 'reporte1') {
      listaReporte1 =
          await apiService.buscarReporte(widget.fecha1, widget.fecha2);
    } else if (widget.informeTipo == 'reporte2') {
      listaReporte2 =
          await apiService.buscarCheck(widget.fecha1, widget.fecha2);
    } else if (widget.informeTipo == 'reporte3') {
      var x = await apiService.buscarNovedad(widget.fecha1, widget.fecha2);
      print(x);
    } else {}
    //await Future.delayed(Duration(seconds: 3));
    print('*******');
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.informeTipo),
      ),
      body: (isLoading)
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fechas del:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.fecha1} - ${widget.fecha2}',
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 16),
                  if (widget.informeTipo == 'reporte1')
                    _ListaReporte1Container(reporte: listaReporte1),
                  if (widget.informeTipo == 'reporte2')
                    _ListaReporteCheckContainer(reporte: listaReporte2),
                  if (widget.informeTipo == 'reporte3')
                    _ListaReporte1Container(reporte: listaReporte1)
                ],
              ),
            ),
    );
  }
}

class _ListaReporte1Container extends StatelessWidget {
  const _ListaReporte1Container({
    required this.reporte,
  });

  final List<Reporte1> reporte;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return Expanded(
      child: ListView.builder(
        itemCount: reporte.length,
        itemBuilder: (_, index) {
          var item = reporte[index];
          return ListTile(
            trailing: GestureDetector(
                onTap: () async {
                  await donwload();
                },
                child: const Icon(Icons.picture_as_pdf)),
            tileColor: color.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: color.primary, width: 1.5),
            ),
            title: Text(item.piloto),
            subtitle: Text(item.fechaRegistro.toString().substring(0, 10)),
          );
        },
      ),
    );
  }

  Future donwload() async {
    //final Directory tempDir = await getTemporaryDirectory();
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World', style: pw.TextStyle(fontSize: 40)),
          ); // Center
        }));
    var x = await file.writeAsBytes(await pdf.save());
  }
}

class _ListaReporteCheckContainer extends StatelessWidget {
  const _ListaReporteCheckContainer({
    required this.reporte,
  });

  final List<ReporteCheck> reporte;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return Expanded(
      child: ListView.builder(
        itemCount: reporte.length,
        itemBuilder: (_, index) {
          var item = reporte[index];
          return Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              trailing: GestureDetector(
                  onTap: () async {
                    await donwload();
                  },
                  child: const Icon(Icons.picture_as_pdf)),
              tileColor: color.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: color.primary, width: 1.5),
              ),
              title: Text(item.piloto ?? '-'),
              subtitle: Text(item.fechaRegistro.toString().substring(0, 10)),
            ),
          );
        },
      ),
    );
  }

  Future donwload() async {
    //final Directory tempDir = await getTemporaryDirectory();
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World', style: pw.TextStyle(fontSize: 40)),
          ); // Center
        }));
    var x = await file.writeAsBytes(await pdf.save());
  }
}
