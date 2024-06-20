import 'dart:convert';

class CidadeModel {
  int id;
  String nome;
  CidadeModel({
    required this.id,
    required this.nome,
  });

  factory CidadeModel.empty() {
    return CidadeModel(
      id: 0,
      nome: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CidadeModel.fromMap(Map<String, dynamic> map) {
    return CidadeModel(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  factory CidadeModel.fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return CidadeModel.fromMap(jsonMap);
  }
}
