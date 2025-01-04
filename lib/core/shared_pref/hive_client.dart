import 'package:hive_flutter/hive_flutter.dart';

import 'hive_keys.dart';

class HiveClient {
  late final Box searchBox;

  static final HiveClient instance = HiveClient._init(); // Singleton

  HiveClient._init();

  // Initialize Hive and open the necessary boxes
  static Future<void> globalInitialize() async {
    await Hive.initFlutter();
    //Search
    instance.searchBox = await Hive.openBox(Search_BOX);
  }
}


