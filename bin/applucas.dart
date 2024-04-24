import 'dart:io';
import 'Alumno.dart';
import 'Profesor.dart';

class applucas {
  menuInicial(){
    int? opcion;
    do{
      stdout.writeln('''Elige una opción
      1 - Crear alumno
      2 - Crear profesor
      3 - Log in alumno
      4 - Log in profesor''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4);
    switch(opcion){
      case 1:
        crearUsuarioAlumno();
        break;
      case 2:
        crearUsuarioProfesor();
        break;
      case 3:
        loginAlumno();
        break;
      case 4:
        loginProfesor();
        break;
      default:
        print('Opción no válida');
    }
  }


loginAlumno() async {
    Alumno alumno = new Alumno();
    stdout.writeln('Introduce tu nombre de usuario');
    alumno.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    alumno.password = stdin.readLineSync();
    var resultado = await alumno.loginAlumno();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
      menuInicial();
    }
  }

  loginProfesor() async {
    Profesor profesor = new Profesor();
    stdout.writeln('Introduce tu nombre de usuario');
    profesor.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    profesor.password = stdin.readLineSync();
    var resultado = await profesor.loginProfesor();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
      menuInicial();
    }
  }
  
  crearUsuarioProfesor() async {
    Profesor profesor = new Profesor();
    stdout.writeln('Introduce tu nombre de profesor');
    profesor.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    profesor.password = stdin.readLineSync();
    profesor.password = profesor.password;
    await profesor.insertarUsuario();
    menuInicial();
  }

  crearUsuarioAlumno() async {
    Alumno alumno = new Alumno();
    stdout.writeln('Introduce tu nombre de alumno');
    alumno.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    alumno.password = stdin.readLineSync();
    alumno.password = alumno.password;
    await alumno.insertarUsuario();
    menuInicial();
  }
}

menuProfesor() {
  int? opcion;
  do{
      stdout.writeln('''
------------------------------------------

      1 - Buscar alumnos
      2 - Lista de alumnos apuntados
      3 - Detalles de profesor
      4 - Volver al menu inicial
  
------------------------------------------
''');
String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4);
    switch(opcion){
      case 1:
        ();
        break;
      case 2:
        listarAlumnos();
        break;
      case 3:
        ();
        break;
      case 4:
        menuInicial();
        break;
      default:
        print('Opción no válida');
    }
  }
  

  listarAlumnos()async{
    List<Alumno> listadoAlumnos = await Alumno().all();
    for(Alumno elemento in listadoAlumnos){
      stdout.writeln(elemento.nombre);
    }
  }