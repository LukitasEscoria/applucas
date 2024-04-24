import 'package:mysql1/mysql1.dart';
import 'Database.dart';

class Profesor {
  int? idusuario;
  String? nombre;
  String? password;

Profesor();

  Profesor.fromMap(ResultRow map) {
    this.idusuario = map['idusuario'];
    this.nombre = map['nombre'];
    this.password = map['password'];
  }

loginProfesor() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM usuarios WHERE nombre = ?', [this.nombre]);
      Profesor profesor = Profesor.fromMap(resultado.first);
      if (this.password == profesor.password) {
        return profesor;
      } else
        return false;
    } catch (e) {
      print(e);
      return false;
    } finally {
      await conn.close();
    }
  }


insertarUsuario() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO usuarios (nombre, password) VALUES (?,?)',
          [nombre, password]);
      print('Usuario insertado correctamente');
    } catch(e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}