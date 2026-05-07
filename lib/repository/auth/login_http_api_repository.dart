import 'package:bloc_clean/config/app_url.dart';
import 'package:bloc_clean/config/data/network/network_services_api.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';

import '../../models/user/user_model.dart';

class LoginHttpApiRepository implements LoginRepository{

  final api = NetworkServicesApi();
  // fun. bnye h
  Future<UserModel> loginApi(dynamic data)async {
    final response = await api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}