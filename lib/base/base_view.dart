import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/base/base_view_model.dart';
import 'package:provider/provider.dart';

abstract class BaseStatelessView<M extends BaseViewModel>
  extends StatelessWidget {
  
  const BaseStatelessView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget resultWidget;

    M viewModel = buildViewModel(context);
    
    if (viewModel != null) {
      resultWidget = ChangeNotifierProvider<M>(create: (context) {
        loadData(context, viewModel);
        return viewModel;
      }, child: Consumer<M>(
        builder: (BuildContext context, M viewModel, Widget child){
          return buildView(context, viewModel);
        },
      ),);
    } else {
      loadData(context, null);
      resultWidget = buildView(context, null);
    }
    return resultWidget;
  }

  Widget buildView(BuildContext context, M viewModel);

  M buildViewModel(BuildContext context);

  void loadData(BuildContext context, M viewModel);

  bool isEnableLoadingView() {
    return false;
  }
}

abstract class BaseStatefulView<M extends BaseViewModel>
  extends StatefulWidget {
  const BaseStatefulView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return buildState();
  }

  BaseStatefulViewState<BaseStatefulView, M> buildState();
}

abstract class BaseStatefulViewState<T extends BaseStatefulView,
  M extends BaseViewModel> extends State<T> {
    M viewModel;

    @override
    void initState() {
      super.initState();
      initData();
    }

    @override
    Widget build(BuildContext context) {
      viewModel = buildViewModel(context);

      Widget resultWidget;

      if (viewModel != null && isBindViewModel()) {
        resultWidget = ChangeNotifierProvider<M>(create: (context){
          loadData(context, viewModel);
          return viewModel;
        }, child: Consumer<M>(
          builder: (BuildContext context, M viewModel, Widget child) {
            return buildView(context, viewModel);
          },
        ),);
      } else {
        loadData(context, viewModel);
        resultWidget = buildView(context, viewModel);
      }

      return resultWidget;
    }

    Widget buildView(BuildContext context, M viewModel);

    void initData();
  
    M buildViewModel(BuildContext context);

    void loadData(BuildContext context, M viewModel);

    bool isBindViewModel() {
      return true;
    }
  }