class LocalStorage {

  final storage = const FlutterSecureStorage();

  // function for setvalue
  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  // function for read value
Future<dynamic> readValue(String key) async{
    return await storage.read(key: key);
}

// function for clear data
Future<bool> clearValue(String key) async {
    await storage.delete(key: key);
    return true;
}
}