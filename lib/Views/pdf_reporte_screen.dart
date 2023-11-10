import 'dart:typed_data';

import 'package:busrefactori/entities/report1.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfReporteScreen extends StatelessWidget {
  final Reporte1 reporte;
  const PdfReporteScreen({super.key, required this.reporte});

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

  Future<Uint8List> generatePDF(Reporte1 reporte) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(children: [
            pw.Container(
              width: double.infinity,
              child: pw.Center(
                  child: pw.Text('REPORTE NOVEDAD EN VIA',
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
              pw.Text('Ubicación del evento:',
                  style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.ubicacion ?? '',
                  style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Hora del evento:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.hora ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Sistema:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.sistema ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
            pw.Row(children: [
              pw.Text('Velocidad:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.velocidad ?? '',
                  style: pw.TextStyle(fontSize: 16))
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
              pw.Text('Detalle:', style: pw.TextStyle(fontSize: 12)),
              pw.Text(reporte.detalle ?? '', style: pw.TextStyle(fontSize: 16))
            ]),
          ]);
        },
      ),
    );
    return pdf.save();
  }
}
