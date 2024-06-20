import 'dart:convert';

import 'cursos_model.dart';
import 'endereco_model.dart';

class AlunosModel {
  int id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<CursosModel> cursos;
  EnderecoModel endereco;
  AlunosModel({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.cursos,
    required this.endereco,
  });

  factory AlunosModel.empty() {
    return AlunosModel(
      id: 0,
      nome: '',
      nomeCursos: [],
      cursos: [],
      endereco: EnderecoModel.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
      'endereco': endereco.toMap(),
    };
    if (idade != null) {
      map['idade'] = idade;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory AlunosModel.fromMap(Map<String, dynamic> map) {
    return AlunosModel(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      idade: map['idade'],
      nomeCursos: List<String>.from(map['nomeCursos'] ?? <String>[]),
      cursos: map['cursos']
              ?.map<CursosModel>((cursosMap) => CursosModel.fromMap(cursosMap))
              .toList() ??
          List<CursosModel>.empty,
      endereco: EnderecoModel.fromMap(map['endereco'] ?? EnderecoModel.empty()),
    );
  }

  factory AlunosModel.fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return AlunosModel.fromMap(jsonMap);
  }

  @override
  String toString() {
    return 'Aluno:$nome  | ID:$id';
  }
}
