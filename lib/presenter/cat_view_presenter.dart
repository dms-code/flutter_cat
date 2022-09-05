import 'dart:typed_data';

import 'package:flutter_cat/repository/cat_repository.dart';
import 'package:flutter_cat/util/response.dart';
import 'package:http/http.dart' as http;

import '../model/cat.dart';

/// The presenter mediate communication between
/// the [CatViewPart][RecentViewPart] with the repository [CatRepository]
class CatViewPresenter {

  late final CatRepository _repository;
  late Cat _filter;
  bool isLoading = false;
  final List<Cat> _recent = [];

  List<Cat> getRecent() => _recent;

  Cat getFilter() => _filter;

  void setFilter(Cat filter) {
    _filter = filter;
  }

  CatViewPresenter(CatRepository repository) {
    _repository = repository;
    _filter = Cat(type: CatType.gif);
  }

  /// Get a random gif cat image from [CatRepository]
  Future<Response<Uint8List>> getRandomCat() async {
    Response<Cat> resp = await _repository.get(_filter);

    if (!resp.hasError()) {
      try {
        _recent.add(resp.getValue()!);

        var gifRawData = await http.get(Uri.parse(resp.getValue()!.url!));

        if (gifRawData.statusCode == 200) {
          return Response<Uint8List>(gifRawData.bodyBytes);
        } else {
          return Response<Uint8List>.error(
              "Not able to download the gif from the url. Error: ${gifRawData.statusCode.toString()}");
        }
      } on Exception {
        return Response<Uint8List>.error(
            "Not able to download the gif from the url.");
      }
    } else {
      return Response<Uint8List>.error(
          "Not able to download the gif from the url.");
    }
  }
}
