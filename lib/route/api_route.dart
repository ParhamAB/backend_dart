import 'package:vania/vania.dart';
import 'package:api_test/app/http/controllers/home_controller.dart';
import 'package:api_test/app/http/middleware/authenticate.dart';
import 'package:api_test/app/http/middleware/home_middleware.dart';
import 'package:api_test/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/home", homeController.create)
        .middleware([AuthenticateMiddleware()]);
    Router.get("/login", homeController.login);

    Router.post("/hello", (Request req) {
      return Response.json({"result": 'Hello ${req.query("name")}'});
    }).middleware([HomeMiddleware()]);

    // Return error code 400
    Router.get('wrong-request',
            () => Response.json({'message': 'Hi wrong request'}))
        .middleware([ErrorResponseMiddleware()]);

    // Return Authenticated user data
    Router.get("/user", () {
      return Response.json(Auth().user());
    }).middleware([AuthenticateMiddleware()]);
  }
}
