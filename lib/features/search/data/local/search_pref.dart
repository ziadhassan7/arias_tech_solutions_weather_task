import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/shared_pref/hive_client.dart';
import '../../../../core/shared_pref/hive_keys.dart';

class SearchPref {
  static final Box _hiveBox = HiveClient.instance.searchBox;


  ///                                                                           / Recent Searches
  //Add / Delete Item
  static Future<void> addSearchItem(String searchItem) async {

    List<String> currentSearchHistory = getAllSearchHistory() ?? [];

    if(currentSearchHistory.contains(searchItem)){
      //if it already exists, make it more recent search, DO NOT DUPLICATE
      currentSearchHistory.remove(searchItem);
      currentSearchHistory.add(searchItem);

    } else {
      currentSearchHistory.add(searchItem);
    }

    await _hiveBox.put(SEARCH_HISTORY, currentSearchHistory);
  }

  static Future<void> removeSearchItem(String searchItem) async {

    List<String> currentSearchHistory = getAllSearchHistory() ?? [];

    currentSearchHistory.remove(searchItem);

    await _hiveBox.put(SEARCH_HISTORY, currentSearchHistory);
  }

  //All Items
  static List<String>? getAllSearchHistory() {
    return _hiveBox.get(SEARCH_HISTORY, defaultValue: null);
  }

  static Future<void> removeAllSearchHistory() {
    return _hiveBox.delete(SEARCH_HISTORY);
  }
}