import 'package:intl/intl.dart';

class ColaboradorEpi {
  final int idEnt;
  final String dataValidade;
  final String dataEntrega;
  final int idEpi;
  final int idCol;

  ColaboradorEpi({
    required this.idEnt,
    required this.dataEntrega,
    required this.dataValidade,
    required this.idEpi,
    required this.idCol,
  });

  factory ColaboradorEpi.fromJson(Map<String, dynamic> json) {
    var parseDV = DateTime.parse(json['dataValidade']);
    final databrv = DateFormat("dd/M/yyyy").format(parseDV);

    var parseDE = DateTime.parse(json['dataValidade']);
    final databre = DateFormat("dd/M/yyyy").format(parseDE);
    return ColaboradorEpi(
        idEnt: json['idEnt'],
        dataEntrega: databrv.toString(),
        dataValidade: databre.toString(),
        idEpi: json['idEpi'],
        idCol: json['idCol']);
  }
}
