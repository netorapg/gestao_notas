import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_notas/dominio/cpf.dart';

main(){
  
  group('Teste de CPF vazio', () {
test('Entidade CPF - teste com cpf sem ser vazio', () {
    expect(()=>CPF('030.217.32-40'), returnsNormally);
  });
test('Entidade CPF - teste com o cpf vazio', () {
  expect(()=>CPF(''), throwsException);
  });

  });

group('[e04] CPF - deve possuir 11 números', () {
  test('teste cpf com 11 números', () {
    expect(()=> CPF('030.217.032-40').eOnzeNumeros(), returnsNormally);
  });
  test('teste cpf com 10 números', () {
    expect(() => CPF('030.217.032-4').eOnzeNumeros(), throwsException);
  });
   test('teste cpf com 12 números', () {
    expect(() => CPF('030.217.032-400').eOnzeNumeros(), throwsException);
  });
});
group('[e05] CPF - verificar se números são diferentes; DE', () {
  test('teste verificando que os caracteres são diferentes', () {
    expect(CPF('030.217.032-40').eNumerosDiferentes(), true);
  });
  test('teste verificando quando a maioria dos caracteres são iguais mas um é diferente', () {
    expect(CPF('888.888.088-88').eNumerosDiferentes(), true);
  });
   test('teste verificando que os caracteres são iguais', () {
    expect(()=> CPF('111.111.111-11').eNumerosDiferentes(), throwsException);
  });
});
group('[e06] CPF - verificar os digitos verificadores; CE', () {
  test('teste verificando se os dois ultimos digitos são válidos', () {
    expect(()=>CPF('030.217.032-40').eDigitosCorretos(), returnsNormally);
  });
   test('teste verificando se os dois ultimos digitos são inválidos', () {
    expect(()=>CPF('030.217.032-44').eDigitosCorretos(), throwsException);
  });
});

}

/*
test('salvar', () {
  var dao = DAOTeste();
  var professor = Professor(dao);
  exp(()=>professor.salvar(), returnsNormally);
});
}

class DAOTeste implements IDAOProfessor{
  @override
  bool salvar() {
    return true;
  }*/