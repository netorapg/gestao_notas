main() {
   definirCor();
  print ('abrir tela');
  print ('carregar botões');
  print ('carregar campos');
  print ('carregar imagens');
}


definirCor() {
  buscarDados().then(
  (value)=> print('definir cor'));
}

buscarDados()  async{
 await Future.delayed(Duration(seconds: 3), (){
    print('caregar dados');
  });
}