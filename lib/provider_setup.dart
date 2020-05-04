import 'package:flutter_provider_demo/api/api.dart';
import 'package:flutter_provider_demo/base/net_model.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = []
  ..addAll(independentServices)
  ..addAll(dependentServices);


// 静态资源
List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, NetModel>(
    update: (context, api, netModel) => NetModel(api),
  ),
];
