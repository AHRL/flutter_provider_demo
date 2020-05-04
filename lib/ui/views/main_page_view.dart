import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_provider_demo/base/base_view.dart';
import 'package:flutter_provider_demo/base/base_view_model.dart';
import 'package:flutter_provider_demo/ui/views/home_view.dart';
import 'package:flutter_provider_demo/ui/views/login_view.dart';

class MainPageView extends BaseStatefulView {
  @override
  BaseStatefulViewState<BaseStatefulView<BaseViewModel>, BaseViewModel>
      buildState() {
    return MainPageViewState();
  }
}

class MainPageViewState
    extends BaseStatefulViewState<MainPageView, BaseViewModel>
    with SingleTickerProviderStateMixin {

  TabController primaryTC;

  int selectedIndex;

  @override
  void initData() {
    primaryTC = TabController(length: 3, vsync: this);
    selectedIndex = 0;
  }

  @override
  Widget buildView(BuildContext context, BaseViewModel viewModel) {
    return Scaffold(
      body: [
        LoginView(),
        HomeView(),
      ][selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('登录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('主页'),
          ),
        ],
        onTap: (index) {
          setState(() {
            this.selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
      ),
    );
  
  }

  @override
  void loadData(BuildContext context, BaseViewModel viewModel) {}

  @override
  BaseViewModel buildViewModel(BuildContext context) {
    return null;
  }
}
