import 'dart:convert';

List<ReporteCheck> reporteCheckFromJson(String str) => List<ReporteCheck>.from(
    json.decode(str).map((x) => ReporteCheck.fromJson(x)));

String reporteCheckToJson(List<ReporteCheck> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReporteCheck {
  final String? gasAntes;
  final String? estado;
  final DateTime? fechaRegistro;
  final String? placabus;
  final String? gasDespues;
  final int? checkId;
  final String? piloto;
  final String? observacion;
  final String? salon;

  ReporteCheck({
    this.gasAntes,
    this.estado,
    this.fechaRegistro,
    this.placabus,
    this.gasDespues,
    this.checkId,
    this.piloto,
    this.observacion,
    this.salon,
  });

  factory ReporteCheck.fromJson(Map<String, dynamic> json) => ReporteCheck(
        gasAntes: json["gas_antes"],
        estado: json["estado"],
        fechaRegistro: json["fecha_registro"] == null
            ? null
            : DateTime.parse(json["fecha_registro"]),
        placabus: json["placabus"],
        gasDespues: json["gas_despues"],
        checkId: json["check_id"],
        piloto: json["piloto"],
        observacion: json["observacion"],
        salon: json["salon"],
      );

  Map<String, dynamic> toJson() => {
        "gas_antes": gasAntes,
        "estado": estado,
        "fecha_registro":
            "${fechaRegistro!.year.toString().padLeft(4, '0')}-${fechaRegistro!.month.toString().padLeft(2, '0')}-${fechaRegistro!.day.toString().padLeft(2, '0')}",
        "placabus": placabus,
        "gas_despues": gasDespues,
        "check_id": checkId,
        "piloto": piloto,
        "observacion": observacion,
        "salon": salon,
      };
}
