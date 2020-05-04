import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/base/base_view.dart';
import 'package:flutter_provider_demo/manager_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_demo/core/constants/app_constants.dart';
import 'package:flutter_provider_demo/core/viewmodels/login_view_model.dart';
import 'package:flutter_provider_demo/ui/shared/app_colors.dart';
import 'package:flutter_provider_demo/ui/widgets/login_header.dart';
import 'package:flutter_provider_demo/utils/utils_toast.dart';

class LoginView extends BaseStatelessView<LoginViewModel> {
  @override
  Widget buildView(BuildContext context, LoginViewModel viewModel) {
    // TODO: implement buildView
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LoginHeader(controller: _controller),
          FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async{
                bool suc = await viewModel.login(_controller.text);
                if (suc) {
                  ToastUtils.showToast("登录成功");
                } else {
                  ToastUtils.showToast("登录失败");
                }
              },
            )
        ],
      )
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
  void loadData(BuildContext context, LoginViewModel viewModel) {
    // TODO: implement loadData
  }

}