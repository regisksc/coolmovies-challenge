import 'dart:convert';

import '../fixtures/fixture_reader.dart';

Map<String, dynamic> mockSuccessForFixture(String fixturePath) {
  return jsonDecode(fixture(fixturePath)) as Map<String, dynamic>;
}

Map<String, dynamic> mockGraphQLRequestFailure() {
  return {
    "errors": [
      {"message": "generic error message"}
    ]
  };
}
