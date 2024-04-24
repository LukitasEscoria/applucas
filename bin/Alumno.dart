import 'package:mysql1/mysql1.dart';
import 'Database.dart';

// Heredar clase profesor y alumno a partir de este fichero "Usuario"

class Alumno {
  int? idusuario;
  String? nombre;
  String? password;

Alumno();

  Alumno.fromMap(ResultRow map) {
    this.idusuario = map['idusuario'];
    this.nombre = map['nombre'];
    this.password = map['password'];
  }

loginAlumno() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM usuarios WHERE nombre = ?', [this.nombre]);
      Alumno alumno = Alumno.fromMap(resultado.first);
      if (this.password == alumno.password) {
        return alumno;
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
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}

all() async{
    var conn = await Database().conexion();
    try{
      var resultado = await conn.query('SELECT * FROM Alumnos') ;
      List<Alumno> alumno= resultado.map((row) => Alumno.fromMap(row)).toList();
      return alumno;
    } catch(e) {
      print(e);
    } finally {
      await conn.close();
    }
  }