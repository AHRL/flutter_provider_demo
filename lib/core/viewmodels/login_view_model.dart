import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider_demo/base/base_view_model.dart';
import 'package:flutter_provider_demo/base/net_model.dart';
import 'package:flutter_provider_demo/core/models/user.dart';

class LoginViewModel extends BaseViewModel {
  NetModel _netModel;

  static String _username = "未登录";

  String get username => _username;

  LoginViewModel(this._netModel);

  Future<bool> login(String name) async{
    bool isLogin = false;
    var res = await _netModel.login(name);
    if (res.data) {
      _username = name;
      notifyListeners();
      print("username$username");
      isLogin = true;
    }
    return isLogin;
  }

  @override
  Widget getProviderContainer() {
    // TODO: implement getProviderContainer
    return null;
  }
}