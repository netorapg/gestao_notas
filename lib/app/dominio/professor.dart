import 'package:gestao_notas/app/dominio/cpf.dart' as validador;
import 'package:gestao_notas/app/dominio/dto/dto_professor.dart';
import 'package:gestao_notas/app/dominio/interface/i_dao_professor.dart';

class Professor{
  late dynamic? id;
  late String nome;
  late String? descricao;
  late String CPF;
  String _status = 'A';
  String get status => _status;
  late DTOProfessor dto;
  set status(String status){
    if(status != 'A' || status != 'I') throw Exception('Status deve ser "A" ou "I".');
    _status = status;
  } 
  IDAOProfessor dao;

  Professor({this.id, required this.nome, this.descricao, required this.CPF, required String status, required this.dao}){

    id = dto.id;
    nome = dto.nome;
    descricao = dto.descricao;
    validador.CPF(CPF);
    eNomeNaoVazio();
    this.status = status;
    dto = DTOProfessor(id: this.id, nome: this.nome,  descricao: this.descricao, CPF: this.CPF, status: this.status);

  }

  bool eNomeNaoVazio(){
    if(nome.isEmpty) throw Exception('Nome não pode ser vazio!');
    return true;
  }

  Future<DTOProfessor> incluir() async {
    return await dao.salvar(dto);
  }

  bool excluir(DTOProfessor dto){
    dao.alterarStatus(dto);
    return true;
  }
}