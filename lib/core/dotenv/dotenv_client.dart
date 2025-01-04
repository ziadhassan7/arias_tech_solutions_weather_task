import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvClient {

  //DO NOT forget to call await when you use this function
  static init() async {
    // To load the .env file contents into dotenv
    await dotenv.load(fileName: ".env");
  }

  static get weatherKey => dotenv.env['WEATHER_KEY'];
  static get mapKey => dotenv.env['MAP_KEY'];
}