import 'Database.dart';
import 'applucas.dart';

main() async {
  await Database().instalacion();
  applucas().menuInicial();
}

