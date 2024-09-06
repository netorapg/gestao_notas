import 'package:gestao_notas/app/dominio/interface/i_dao_professor.dart';
import 'package:gestao_notas/dominio/professor.dart';

class AProfessor {
  Professor professor;
  IDAOProfessor dao;

  AProfessor({required this.professor, required this.dao}) {
  }
  salvar() {
    professor.salvar();
  }
}