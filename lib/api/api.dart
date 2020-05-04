import 'package:flutter_provider_demo/http/manager_net_request.dart';

class Api {
  // 设置请求的地址
  static const String BASE_URL = "";

  var client = NetRequestManager.instance;

  Future<BaseResponse<bool>> login(String username) async {
    // var response;
    BaseResponse<bool> result = BaseResponse();
    // try {
    //   response =
    //       await client.getRequest(BASE_URL + 'login',
    //       queryParameters: {
    //         "username": username
    //       });
    //   bool isOk = response?.data["ok"];
    //   result.isSuccess = isOk;
    // } catch (e) {
    //   print("$e");
    //   result.isSuccess = false;
    // }
    result.isSuccess = true;
    result.data = true;
    // 这里就默认返回true了
    return result;
  }
}

class BaseResponse<T> {
  bool isSuccess;
  T data;
}