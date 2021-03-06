import 'package:dio/dio.dart';

class NetRequestManager {
// 工厂模式
  factory NetRequestManager() => _getInstance();

  static NetRequestManager get instance => _getInstance();
  static NetRequestManager _instance;

  NetRequestManager._internal() {
    // 初始化
    _init();
  }

  Dio _dio;

  static NetRequestManager _getInstance() {
    if (_instance == null) {
      _instance = new NetRequestManager._internal();
    }
    return _instance;
  }

  void _init() {
    // 设置响应超时时间
    _dio = Dio(new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ));

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // print("请求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      // print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      // print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }

  // get请求
  Future<Response<T>> getRequest<T>(
    String url, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    var response = await _dio.get(url, queryParameters: queryParameters,options: options,cancelToken: cancelToken,onReceiveProgress: onReceiveProgress);
    return response;
  }

  // post请求
  Future<Response<T>> postRequest<T>(
    String url, 
    Object data
    ) async {
    var response = await _dio.post(url, data: data);
    return response;
  }
}

abstract class RequestCallback<T> {
  void onSuccess(T requestData);

  void onFailed(Exception e);
}
