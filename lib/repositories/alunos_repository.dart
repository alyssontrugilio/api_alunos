import '../models/alunos_model.dart';

abstract class AlunosRepository {
  Future<List<AlunosModel>> buscarTodos();
  Future<AlunosModel> buscarTodosPorId({required int id});
}
