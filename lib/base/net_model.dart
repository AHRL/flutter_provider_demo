import 'package:flutter_provider_demo/api/api.dart';
import 'package:flutter_provider_demo/core/models/user.dart';

class NetModel {
  final Api _api;

  User user = User();

  NetModel(this._api);

  Future<BaseResponse<bool>> login (String username) {
    return _api.login(username);
  }
}