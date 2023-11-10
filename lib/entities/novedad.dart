import 'dart:convert';

List<Novedad> novedadFromJson(String str) =>
    List<Novedad>.from(json.decode(str).map((x) => Novedad.fromJson(x)));

String novedadToJson(List<Novedad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Novedad {
  String? descripcion;
  int? id;
  String? falla;
  DateTime? fechaRegistro;
  String? placabus;
  String? detalle;
  String? piloto;

  Novedad({
    this.descripcion,
    this.id,
    this.falla,
    this.fechaRegistro,
    this.placabus,
    this.detalle,
    this.piloto,
  });

  factory Novedad.fromJson(Map<String, dynamic> json) => Novedad(
        descripcion: json["descripcion"],
        id: json["id"],
        falla: json["falla"],
        fechaRegistro: json["fecha_registro"] == null
            ? null
            : DateTime.parse(json["fecha_registro"]),
        placabus: json["placabus"],
        detalle: json["detalle"],
        piloto: json["piloto"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "id": id,
        "falla": falla,
        "fecha_registro":
            "${fechaRegistro!.year.toString().padLeft(4, '0')}-${fechaRegistro!.month.toString().padLeft(2, '0')}-${fechaRegistro!.day.toString().padLeft(2, '0')}",
        "placabus": placabus,
        "detalle": detalle,
        "piloto": piloto,
      };
}
