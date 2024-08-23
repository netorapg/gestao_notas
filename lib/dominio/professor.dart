import 'package:gestao_notas/dominio/cpf.dart' as validador;
import 'package:gestao_notas/dominio/dto/dto_professor.dart';
import 'package:gestao_notas/dominio/interface/IDAOProfessor.dart';

class Professor {
  late dynamic id;
  late String nome;
  late String? descricao;
  late String CPF;
  late String _status;
  String get status => _status; // Propriedade da classe
  set status(String status) {
    if (status == 'A' || status == 'I') {
      _status = status;
    } else {
      throw Exception('Status deve ser "A" ou "I".');
    }
  }

  late IDAOprofessor dao;
  late DTOProfessor dto;

  Professor({required this.dto, required this.dao}) {
    id = dto.id;
    nome = dto.nome;
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio');
    descricao = dto.descricao;
    CPF = dto.cpf;
    status = dto.status;
    if (status.isEmpty) throw Exception('Status não pode ser vazio');
    validador.CPF(CPF);
  }

  eNomeVazio() {
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio');
  }

  DTOProfessor salvar(DTOProfessor dto) {
    eNomeVazio();
    return dao.salvar(dto);
  }
}

/*
Permitir que o aluno realize a gestão de aprovação e notas das disciplinas de um curso. O aplicativo deverá:
* campo obrigatório (não pode ser nulo e nem vazio)
_ único
[R005]	Professor das disciplinas
[c01]	O aluno deverá ser capaz de incluir;
	[e01]	Campos: nome*, descrição, _CPF*, status;
	[e02]	Necessário ter o campo identificador id;
	[e03]	Status deve ser A (ativo) ou I (Inativo);
	[e03]	Status deve ter o valor padrão 'A';
	[e04]	Definir campo Ativo para controle de registros atuais;
	[e05]	CPF – não pode ser vazio ou nulo; CE
	[e06]	CPF – deve possuir 11 números; VL
	[e07]	CPF - verificar se números são diferentes; DE
	[e08]	CPF – verificar os dígitos verificadores; CE
	[e09]	CPF – deve ser único.
[c02]	O aluno deverá ser capaz de excluir; 
	[e01]	Ao invés de excluir, alterar ativo para inativo;
[c03]	O aluno deverá ser capaz de alterar; 
	[e01]	Caso alterar CPF [c01][e03][c01][e05][c01][e06];
[c04]	O aluno deverá ser capaz de consultar;
	[e01]	Consultar todos os registros ativos;
	[e02]	Consultar por id;
	[e03]	Consultar por cpf;
[R006]	O aluno deverá ser capaz de acompanhar as médias trimestrais das disciplinas do curso;
[c01]	O ano letivo é subdivido em três trimestres;
[e01]	O período (trimestre) do sistema será estático/definido;
[c02]	Cada trimestre deverá possuir uma média trimestral para cada disciplina;
[c03]	Um trimestre deverá possuir ao menos 2 avaliações para cada disciplina;
[c04]	Um trimestre deverá possuir ao menos 1 avaliação de recuperação;
[c05]	Independente da nota, o aluno poderá realizar a avaliação de recuperação;
[c06]	Se realizado, o que prevalece é a nota da avaliação de recuperação;
[c07]	Não há limite máximo para avaliações em cada trimestre;
[c08]	Todas as avaliações são representadas de 0 à 10;
[c09]	O média é calculada pela aritmética ponderada;
[R007]	O aluno deverá ser capaz de acompanhar a nota final do ano letivo;
[R008]	Disciplina
[R009]	O aluno deverá ser capaz de acompanhar a aprovação das disciplinas do curso;
[c01]	Para aprovação, o aluno deverá possuir a presença de 75% da CH da disciplina;
[c02]	A gestão será especificamente para um curso;
[c03]	O curso está organizado em quatro séries;
[c04]	Cada série possui um conjunto disciplinas;
[c05]	O nome da disciplina deverá ser único no curso;
[c06]	Cada disciplina deverá possuir uma CH;
[c07]	Independente da média da nota da disciplina, o aluno estará reprovado caso não atinja o percentual necessário de presença;
[c08]	É necessário apresentar a quantidade de faltas para cada disciplina;
[c09]	É necessário alertar o aluno quando este estiver com 10% de falta; 
[c10]	É necessário alertar o aluno quando este estiver com 20% de falta;
[c11]	É necessário informar o aluno quando este estiver reprovado por falta;
[c12]	Para aprovação, o aluno deverá possuir a média anual maior ou igual a 6,0; 
[c13]	Antes da conclusão do ano letivo, informar a média trimestral necessária para aprovação;
[c14]	É necessário informar o aluno quando este estiver reprovado por nota;
[R010]	O aluno deverá ser capaz de manipular as notas das disciplinas do curso; 
[c01]	O aluno poderá inserir a(s) nota(s) de uma disciplina;
[c02]	O aluno poderá alterar a(s) nota(s) de uma disciplina;
[c03]	O aluno poderá excluir a(s) nota(s) de uma disciplina;
[c04]	O aluno poderá alterar a(s) nota(s) de uma disciplina;
[c05]	O registro da avaliação deverá possuir: data da realização, trimestre, nome, série e a nota da avaliação;
[c06]	O aluno poderá inserir a ausência de nota em caso de não realizar a avaliação;
[R011]	O aluno deverá ser capaz de manipular as presenças de aulas das disciplinas do curso;
[c01]	O aluno poderá inserir a(s) faltas(s) de uma disciplina;
[c02]	O aluno poderá alterar a(s) falta(s) de uma disciplina;
[c03]	O aluno poderá excluir a(s) falta(s) de uma disciplina;
[c04]	O aluno poderá alterar a(s) falta(s) de uma disciplina; 
[R012]	Registro de avaliações
[R013]	Dependência parcial das disciplinas
[R014]	Progressão parcial das disciplinas
*/