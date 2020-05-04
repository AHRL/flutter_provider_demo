import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/base/base_view.dart';
import 'package:flutter_provider_demo/base/base_view_model.dart';
import 'package:flutter_provider_demo/core/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends BaseStatefulView<LoginViewModel> {

  @override
  BaseStatefulViewState<BaseStatefulView<BaseViewModel>, LoginViewModel> buildState() {
    return HomeViewState();
  }
}

class HomeViewState extends BaseStatefulViewState<HomeView, LoginViewModel>{
  @override
  Widget buildView(BuildContext context, LoginViewModel viewModel) {
    // TODO: implement buildView
    String username = viewModel.username;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
        actions: <Widget>[],
      ),
      body: Center(
        child: Text(
          "hello $username"
        )
      ),
    );
  }

  @override
  LoginViewModel buildViewModel(BuildContext context) {
    // TODO: implement buildViewModel
    return LoginViewModel(
      Provider.of(context)
    );
  }

  @override
  void initData() {
    // TODO: implement initData
  }

  @override
  void loadData(BuildContext context, LoginViewModel viewModel) {
    // TODO: implement loadData
  }

}