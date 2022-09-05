import 'package:flutter/widgets.dart';
import 'package:flutter_cat/datasource/remote/caas_api.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';
import '../../presenter/cat_view_presenter.dart';
import '../../repository/cat_repository.dart';

// ignore: must_be_immutable
class InjectorWidget extends InheritedWidget {

  late CaasAPI _api;
  late CatRepository _catRepository;
  late AppViewPresenter _appViewPresenter;
  late CatViewPresenter _catViewPresenter;

  InjectorWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  Future<void> init() async {

    _api = CaasAPI();
    _catRepository = CatRepository(_api);
    _appViewPresenter = AppViewPresenter();
    _catViewPresenter = CatViewPresenter(_catRepository);

  }

  CaasAPI api ()=> _api;
  CatRepository catRepository ()=> _catRepository;
  AppViewPresenter appViewPresenter ()=> _appViewPresenter;
  CatViewPresenter catViewPresenter ()=> _catViewPresenter;

  static InjectorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InjectorWidget>()!;
  }

  @override
  bool updateShouldNotify(InjectorWidget oldWidget) => false;
}
