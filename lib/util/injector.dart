import '../datasource/remote/cataas_api.dart';
import '../presenter/appview_presenter.dart';
import '../presenter/cat_view_presenter.dart';
import '../repository/cat_repository.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';


class Injector {

  late Logger _logger;
  late CataasAPI _api;
  late CatRepository _catRepository;
  late AppViewPresenter _appViewPresenter;
  late CatViewPresenter _catViewPresenter;

  Injector();

  Future<void> init() async {

    final dio = Dio(); // Provide a dio instance

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (e, handler) {
        if(e.data is Map){
          Map data = e.data;
          data["baseURL"] = e.realUri.origin;
        }

        handler.next(e);
      },
      onError: (e, handler) {
        handler.next(e);
      },
    ));

    _logger = Logger(printer: PrettyPrinter(printEmojis: true));
    _api = CataasAPI(dio);
    _catRepository = CatRepository(_api, _logger);
    _appViewPresenter = AppViewPresenter(_logger);
    _catViewPresenter = CatViewPresenter(_catRepository, _logger);

  }

  get api => _api;
  get catRepository => _catRepository;
  get appViewPresenter => _appViewPresenter;
  get catViewPresenter => _catViewPresenter;

}
