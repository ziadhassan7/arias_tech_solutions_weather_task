import 'core/dotenv/dotenv_client.dart';
import 'core/shared_pref/hive_client.dart';

Future<void> init() async {

  //init Hive (Local Storage)
  await HiveClient.globalInitialize();

  // Load Env
  await DotEnvClient.init();
}
