import 'package:flutter/rendering.dart';

import '../core.dart';

class GQLRequestFailure extends Failure {
  GQLRequestFailure(String rawMessage)
      : super(
            message: "Oops... An error occured when processing your request") {
    debugPrint("EXCEPTION: $rawMessage");
  }
}
