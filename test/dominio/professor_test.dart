import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_notas/dominio/dto/dto_professor.dart';
import 'package:gestao_notas/dominio/interface/IDAOProfessor.dart';
import 'package:gestao_notas/dominio/professor.dart';

void main() {
  group('Teste em relação ao nome do professor', () {
    test('teste com nome vazio', () {
      var dto = DTOProfessor(
          id: 1,
          nome: '',
          descricao: 'Bonito',
          cpf: '030.217.032-40',
          status: 'A');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), throwsException);
    });

    test('teste com nome não vazio', () {
      var dto = DTOProfessor(
          id: 1,
          nome: 'João',
          descricao: 'Bonito',
          cpf: '030.217.032-40',
          status: 'A');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), returnsNormally);
    });
  });
  group('Teste com o status do professor', () {
    test('teste com status diferente de A ou I', () {
      var dto = DTOProfessor(
          id: 1,
          nome: 'João',
          descricao: 'Bonito',
          cpf: '030.217.032-40',
          status: 'B');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), throwsException);
    });

    test('teste com status igual a A', () {
      var dto = DTOProfessor(
          id: 1,
          nome: 'João',
          descricao: 'Bonito',
          cpf: '030.217.032-40',
          status: 'A');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), returnsNormally);
    });

    test('teste com status igual a I', () {
      var dto = DTOProfessor(
          id: 1,
          nome: 'João',
          descricao: 'Bonito',
          cpf: '030.217.032-40',
          status: 'I');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), returnsNormally);
    });
  });

  group('Teste com a descrição do professor', () {
    test('teste com descrição vazia', () {
      var dto = DTOProfessor(
          id: 1,
          nome: 'João',
          descricao: '',
          cpf: '030.217.032-40',
          status: 'A');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), returnsNormally);
    });

    test('teste com descrição não vazia', () {
      var dto = DTOProfessor(
          id: 1,
          nome: 'João',
          descricao: 'Bonito',
          cpf: '030.217.032-40',
          status: 'A');
      var dao = DAOProfessorFake();
      expect(() => Professor(dto: dto, dao: dao), returnsNormally);
    });
  });
}

class DAOProfessorFake implements IDAOprofessor {
  @override
  DTOProfessor salvar(DTOProfessor dto) {
    return dto;
  }
}
