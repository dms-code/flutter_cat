import 'package:flutter_cat/datasource/remote/caas_api.dart';
import 'package:flutter_cat/presenter/appview_presenter.dart';
import '../presenter/cat_view_presenter.dart';
import '../repository/cat_repository.dart';

class Injector {

  late CaasAPI _api;
  late CatRepository _catRepository;
  late AppViewPresenter _appViewPresenter;
  late CatViewPresenter _catViewPresenter;

  Injector();

  Future<void> init() async {

    _api = CaasAPI();
    _catRepository = CatRepository(_api);
    _appViewPresenter = AppViewPresenter();
    _catViewPresenter = CatViewPresenter(_catRepository);

  }

  get api => _api;
  get catRepository => _catRepository;
  get appViewPresenter => _appViewPresenter;
  get catViewPresenter => _catViewPresenter;

}
