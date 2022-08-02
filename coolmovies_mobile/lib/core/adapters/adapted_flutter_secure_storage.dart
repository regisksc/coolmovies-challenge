import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_adapter.dart';

class AdaptedFlutterSecureStorage implements StorageAdapter {
  AdaptedFlutterSecureStorage(this.storage);
  final FlutterSecureStorage storage;

  @override
  Future<Map<String, dynamic>> read(String key) async {
    final readValue = await storage.read(key: key);
    if (readValue == null) return {};
    return jsonDecode(readValue) as Map<String, dynamic>;
  }

  @override
  Future write(String key, dynamic value) async {
    return storage.write(key: key, value: jsonEncode(value));
  }
}
