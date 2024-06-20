import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/alunos_model.dart';
import '../repositories/alunos_repository.dart';

class AlunosRepositoryImpl implements AlunosRepository {
  @override
  Future<List<AlunosModel>> buscarTodos() async {
    final response = await http.get(Uri.parse('http://localhost:8080/alunos'));

    final alunosList = jsonDecode(response.body);

    final todosAlunos = alunosList.map<AlunosModel>((alunosMap) {
      return AlunosModel.fromMap(alunosMap);
    }).toList();

    return todosAlunos;
  }

  @override
  Future<AlunosModel> buscarTodosPorId({required int id}) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/alunos/$id'));

    return AlunosModel.fromJson(response.body);
  }
}
