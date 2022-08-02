abstract class StorageAdapter {
  Future<Map<String, dynamic>> read(String key);
  Future write(String key, dynamic value);
}
