import 'package:bloc_clean/config/app_url.dart';
import 'package:bloc_clean/config/data/network/network_services_api.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';

import '../../models/user/user_model.dart';

class LoginMockApiRepository implements LoginRepository{

  final api = NetworkServicesApi();
  // fun. bnye h
  Future<UserModel> loginApi(dynamic data)async {
await Future.delayed(Duration(seconds: 2));
final response = {'token' : 'sdf23eaxkj23'};
return UserModel.fromJson(response);
  }
}