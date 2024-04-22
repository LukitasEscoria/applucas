import 'dart:io';
import 'Usuario.dart';

class applucas {
  menuInicial(){
    int? opcion;
    do{
      stdout.writeln('''Elige una opción
      1 - Crear usuario
      2 - Log in''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2);
    switch(opcion){
      case 1:
        crearUsuario();
        break;
      case 2:
        login();
        break;
      default:
        print('Opción no válida');
    }
  }


login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
      menuInicial();
    }
  }

crearUsuario() async {
    Usuario usuario = new Usuario();
    int? opcion;
    do{
      stdout.writeln('''¿Qué eres?
      1 - Profesor
      2 - Alumno''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2);
    switch(opcion){
      case 1:
        crearUsuarioProfesor();
        break;
      case 2:
        crearUsuarioAlumno();
        break;
      default:
        print('Opción no válida');
    }
  }
  
  crearUsuarioProfesor() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de profesor');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    usuario.password = usuario.password;
    await usuario.insertarUsuario();
    menuInicial();
  }

  crearUsuarioAlumno() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de alumno');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    usuario.password = usuario.password;
    await usuario.insertarUsuario();
    menuInicial();
  }
}