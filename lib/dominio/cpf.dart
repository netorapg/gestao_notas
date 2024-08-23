class CPF {
  late List<int> numerosCPF;
  CPF(String cpf) {
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio');
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    numerosCPF = cpf.split('').map(int.parse).toList();
    eOnzeNumeros();
    eNumerosDiferentes();
    eDigitosCorretos(); 
}
 bool eOnzeNumeros() {
     if (numerosCPF.length != 11) throw Exception('CPF deve possuir 11 números');
     return true;
    }

bool eNumerosDiferentes() {
    for (var i = 0; i < 9; i++) {
      if (numerosCPF[0] != numerosCPF[i]) {
        return true;
      }
    }
    throw Exception('CPF não poder ter todos os núemros iguais');
  }



bool eDigitosCorretos(){

  int soma1 = 0;
  int soma2 = 0;
  
  for(var i = 0; i < 9; i++) {
    soma1 += numerosCPF[i] * (10 - i); 
  }
  for(var i = 0; i < 10; i++) {
    soma2 += numerosCPF[i] * (11 - i); 
  }
  int digito1 = (soma1 * 10) % 11;
  int digito2 = (soma2 * 10) % 11;
  if(digito1 == 10) digito1 = 0;
  if(digito2 == 10) digito2 = 0;
  if(digito1 != numerosCPF[9] || digito2 != numerosCPF[10]) throw Exception('CPF com digitos verificadores inválidos');
  return true;

}

  
}


/*
CPF - não pode ser vazio ou nulo; CE
[e04] CPF - deve possuir 11 numeros; VL
[e05] CPF - verificar se números são diferentes; DE
[e06] CPF - verificar os digitos verificadores; CE
[e07] CPF - deve ser único.
*/