import 'package:api_test/app/models/user.dart';
import 'package:vania/vania.dart';

class HomeController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello Home'});
  }

  Future<Response> create() async {
    return Response.json({"status": "ok"});
  }

  Future<Response> login(Request request) async {
    final user = request.query("user");
    final pass = request.query("pass");
    final loginUser = await User().query().where("user", "=", user).first(); // in moheme *****
    final auth = Auth().login(loginUser!);
    final token = await auth.createToken(
        expiresIn: Duration(days: 30), withRefreshToken: true);
    return Response.json({"code": 200, "msg": "successful", "token": token});
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({});
  }

  Future<Response> destroy(int id) async {
    return Response.json({});
  }
}

final HomeController homeController = HomeController();
