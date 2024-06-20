import 'infra/alunos_repository_impl.dart';

Future<void> main() async {
  final alunosRepository = AlunosRepositoryImpl();

  final alunosBuscarTodos = await alunosRepository.buscarTodos();
  final alunosBuscarPorId = await alunosRepository.buscarTodosPorId(id: 1);
  print(alunosBuscarTodos);
  print(alunosBuscarPorId);
}
