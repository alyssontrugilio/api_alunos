import 'dart:convert';

class CursosModel {
  int id;
  String nome;
  bool isAluno;
  CursosModel({
    required this.id,
    required this.nome,
    required this.isAluno,
  });

  factory CursosModel.empty() {
    return CursosModel(
      id: 0,
      nome: '',
      isAluno: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'isAluno': isAluno,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CursosModel.fromMap(Map<String, dynamic> map) {
    return CursosModel(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      isAluno: map['isAluno'] ?? false,
    );
  }

  factory CursosModel.fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return CursosModel.fromMap(jsonMap);
  }
}
