import 'dart:developer';

import 'package:vania/vania.dart';

class ErrorResponseMiddleware extends Middleware {
  @override
  handle(Request req) async {
    if (req.header('content-type') != 'application/json') {
      abort(404, 'RIDI');
    }
    print(req.toJson().toString());
  }
}
