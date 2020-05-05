# flutter_provider_demo

flutter中provider的基础配置demo

## 项目介绍

在provider_setup.dart中，全局需要的model放在最顶层，而ProxyProvider能够将不同provider中的多个值整合成一个对象，并将其发送给外层provider，当所依赖的多个provider中的任意一个发生变化时，这个新的对象都会更新。这个文件中配置的都是放在顶层的model。

在网络请求部分，因为服务端返回的都是json数据，在flutter中需要将返回的数据转换为Map。有两种方式，一种是手动转换，参考文件core/models/user.dart，第二种是使用代码生成库序列化json，参考官网[JSON和序列化](https://flutterchina.club/json/)。

## 致谢
该demo参考的是[lwlizhe的flutter_novel](https://github.com/lwlizhe/flutter_novel)，作者大大解决了我的一些疑问，并给我推荐了[Flutter的资料](https://github.com/FilledStacks/flutter-tutorials)，参考两种provider的基础配置，个人觉得lwlizhe大大的配置更符合我的习惯，更加清晰。