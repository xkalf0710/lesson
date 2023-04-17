
import 'package:lesson/model/user.dart';
import 'package:lesson/utils/http_request.dart';

class UserApi extends HttpRequest{
  Future<User> login(User data) async{
    var res = await post("login", data: data.toJson());
    return User.fromJson(res as Map<String, dynamic>);
  }
}