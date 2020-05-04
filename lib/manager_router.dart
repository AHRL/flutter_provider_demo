
import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/base/base_router_manager.dart';
import 'package:flutter_provider_demo/ui/views/home_view.dart';
import 'package:flutter_provider_demo/ui/views/login_view.dart';

class APPRouter extends BaseRouterManager {
  static const String ROUTER_NAME_LOGIN = "app://demo/login";
  static const String ROUTER_NAME_HOME = "app://demo/home";

// 工厂模式 : 单例公开访问点
  factory APPRouter() => _getInstance();

  static APPRouter get instance => _getInstance();

  // 静态私有成员，没有初始化
  static APPRouter _instance;

  // 私有构造函数
  APPRouter._internal() {
    // 初始化
  }

  // 静态、同步、私有访问点
  static APPRouter _getInstance() {
    if (_instance == null) {
      _instance = new APPRouter._internal();
    }
    return _instance;
  }


  void route(APPRouterRequestOption option) {
    if (option == null) {
      return;
    }

    switch (option.targetName) {
      case ROUTER_NAME_LOGIN:
        jumpToTarget(option, LoginView());
        break;
      case ROUTER_NAME_HOME:
        jumpToTarget(option, HomeView());
        break;
    }
  }
}

class APPRouterRequestOption extends RouterRequestOption {
  Map<String, dynamic> params;

  APPRouterRequestOption(String targetName, BuildContext context, {this.params})
      : super(targetName, context);
}