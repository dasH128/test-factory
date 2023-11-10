import 'dart:typed_data';

import 'package:busrefactori/entities/reporte_check.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfCheckScreen extends StatelessWidget {
  final ReporteCheck reporte;
  const PdfCheckScreen({super.key, required this.reporte});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documento'),
      ),
      body: PdfPreview(
        build: (format) => generatePDF(reporte),
      ),
    );
  }

  Future<Uint8List> generatePDF(ReporteCheck reporte) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(children: [
            pw.Container(
              width: double.infinity,
              child: pw.Center(
                  child: pw.Text('REPORTE LISTA DE CHEQUEO',
                      style: pw.TextStyle(fontSize: 25))),
            ),
            pw.SizedBox(height: 100),
            pw.Row(children: [
              pw.Text('Nombre piloto:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.piloto ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Bus:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.placabus ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Presión de gas ántes:',
                  style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.gasAntes ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Presión de gas después:',
                  style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.gasDespues ?? '',
                  style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Salon:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.salon ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Fecha:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(
                  reporte.fechaRegistro
                          ?.toLocal()
                          .toString()
                          .substring(0, 10) ??
                      '',
                  style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Observación:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.observacion ?? '',
                  style: pw.TextStyle(fontSize: 16))
            ]),
          ]);
        },
      ),
    );
    return pdf.save();
  }
}
