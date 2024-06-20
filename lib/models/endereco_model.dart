import 'dart:convert';

import 'cidade_model.dart';
import 'telefone_model.dart';

class EnderecoModel {
  String rua;
  int numero;
  String cep;
  CidadeModel cidade;
  TelefoneModel telefone;
  EnderecoModel({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  factory EnderecoModel.empty() {
    return EnderecoModel(
      rua: '',
      numero: 0,
      cep: '',
      cidade: CidadeModel.empty(),
      telefone: TelefoneModel.empty(),
    );
  }

  Map<String, dynamic> toMap() => {
        'rua': rua,
        'numero': numero,
        'CEP': cep,
        'cidade': cidade.toMap(),
        'telefone': telefone.toMap(),
      };

  String toJson() => jsonEncode(toMap());

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      cep: map['CEP'] ?? '',
      cidade: CidadeModel.fromMap(map['cidade'] ?? CidadeModel.empty()),
      telefone: TelefoneModel.fromMap(map['telefone'] ?? TelefoneModel.empty()),
    );
  }

  factory EnderecoModel.fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return EnderecoModel.fromMap(jsonMap);
  }
}
