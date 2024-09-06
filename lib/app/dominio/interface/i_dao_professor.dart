import 'package:gestao_notas/app/dominio/dto/dto_professor.dart';

abstract class IDAOProfessor{
  Future<DTOProfessor> salvar(DTOProfessor dto);
  Future<DTOProfessor> alterarStatus(DTOProfessor dto);
}