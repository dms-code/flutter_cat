
import 'package:flutter/widgets.dart';
import 'package:flutter_cat/datasource/remote/caas_api.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';
import 'package:flutter_cat/presenter/gifview_presenter.dart';
import 'package:flutter_cat/repository/catgif_repository.dart';

// ignore: must_be_immutable
class InjectorWidget extends InheritedWidget {

  late CaasAPI _api;
  late CatGifRepository _gifRepository;
  late AppViewPresenter _appViewPresenter;
  late GifViewPresenter _gifViewPresenter;

  InjectorWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  Future<void> init() async {

    _api = CaasAPI();
    _gifRepository = CatGifRepository(_api);
    _appViewPresenter = AppViewPresenter();
    _gifViewPresenter = GifViewPresenter(_gifRepository);

  }

  CaasAPI api ()=> _api;
  CatGifRepository gifRepository ()=> _gifRepository;
  AppViewPresenter appViewPresenter ()=> _appViewPresenter;
  GifViewPresenter gifViewPresenter ()=> _gifViewPresenter;

  static InjectorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InjectorWidget>()!;
  }

  @override
  bool updateShouldNotify(InjectorWidget oldWidget) => false;
}
