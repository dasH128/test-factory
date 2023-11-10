import 'dart:convert';

List<Reporte1> reporte1FromJson(String str) =>
    List<Reporte1>.from(json.decode(str).map((x) => Reporte1.fromJson(x)));

String reporte1ToJson(List<Reporte1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reporte1 {
  String ubicacion;
  DateTime fechaRegistro;
  String placabus;
  String hora;
  String sistema;
  int reporteId;
  String piloto;
  String velocidad;
  String detalle;

  Reporte1({
    required this.ubicacion,
    required this.fechaRegistro,
    required this.placabus,
    required this.hora,
    required this.sistema,
    required this.reporteId,
    required this.piloto,
    required this.velocidad,
    required this.detalle,
  });

  factory Reporte1.fromJson(Map<String, dynamic> json) => Reporte1(
        ubicacion: json["ubicacion"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
        placabus: json["placabus"],
        hora: json["hora"],
        sistema: json["sistema"],
        reporteId: json["reporte_id"],
        piloto: json["piloto"],
        velocidad: json["velocidad"],
        detalle: json["detalle"],
      );

  Map<String, dynamic> toJson() => {
        "ubicacion": ubicacion,
        "fecha_registro":
            "${fechaRegistro.year.toString().padLeft(4, '0')}-${fechaRegistro.month.toString().padLeft(2, '0')}-${fechaRegistro.day.toString().padLeft(2, '0')}",
        "placabus": placabus,
        "hora": hora,
        "sistema": sistema,
        "reporte_id": reporteId,
        "piloto": piloto,
        "velocidad": velocidad,
        "detalle": detalle,
      };
}
