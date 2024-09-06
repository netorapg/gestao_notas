import 'package:gestao_notas/app/banco/sqlite/conexao.dart';
import 'package:gestao_notas/app/dominio/dto/dto_professor.dart';
import 'package:gestao_notas/app/dominio/interface/i_dao_professor.dart';
import 'package:sqflite/sqflite.dart';



class DAOProfessor implements IDAOProfessor {
  late Database _db;
  @override
  Future<DTOProfessor> alterarStatus(DTOProfessor dto) {
    // TODO: implement alterarStatus
    throw UnimplementedError();
  }

  @override
  Future<DTOProfessor> salvar(DTOProfessor dto) async {
    _db = await Conexao.get();
    int id = await _db
        .rawInsert('''INSERT INTO professor (nome, descricao,cpf,status)
      VALUES (?,?,?,?)''', [dto.nome, dto.descricao, dto.CPF, dto.status]);
    dto.id = id;
    return dto;
  }
}


