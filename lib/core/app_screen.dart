import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppScreen{

  BuildContext context;

  late final double width;
  late final double height;

  AppScreen(this.context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static void preventScreenRotation(){
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

  }
}