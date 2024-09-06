import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_notas/app/banco/script.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() {
  setUpAll(() {
  databaseFactory = databaseFactoryFfi;
  sqfliteFfiInit();
  });
  test('teste script create table', () async {
    var db = await openDatabase(inMemoryDatabasePath,
    version: 2,
    onCreate: (db, version) { 
    criarTabelas.forEach(db.execute);
    inserirRegistros.forEach(db.execute);
    });

    var list = await db.rawQuery('SELECT * FROM professor');
    expect(()=>criarTabelas.forEach(db.execute), returnsNormally);
    expect(list.length, 3);
  });

}