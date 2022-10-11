import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cat/repository/cat_repository.dart';
import 'package:http/http.dart' as http;

import '../model/cat.dart';

/// The presenter mediate communication between
/// the [CatViewPart][RecentViewPart] with the repository [CatRepository]
class CatViewPresenter extends ChangeNotifier {

  late final CatRepository _repository;
  late Cat _filter;
  bool? isLoading;
  String? errorMessage;
  Uint8List? imageRawData;
  final List<Cat> _recent = [];

  List<Cat> getRecent() => _recent;

  get getTag => _filter.tag;
  get getLabel => _filter.label;
  get getType => _filter.type;
  
  void setLabel(String label){
    _filter.label = label;
  }
  
  void setTag(String tag){
    _filter.tag = tag;
  }

  void setImageType(bool gif){
     _filter.type = gif ? CatType.gif : CatType.image;
  }

  CatViewPresenter(CatRepository repository) {
    _repository = repository;
    _filter = Cat(type: CatType.gif);
  }

  /// Get a random gif cat image from [CatRepository]
  Future<void> getRandomCat() async {

    isLoading = true;

    _repository.get(_filter).then((resp) async {

      isLoading = false;
      
      if (!resp.hasError()) {
          try {
            _recent.add(resp.getValue()!);

            var gifRawData = await http.get(Uri.parse(resp.getValue()!.url!));

            if (gifRawData.statusCode == 200) {
              imageRawData = gifRawData.bodyBytes;              
            } else {
              errorMessage = "Not able to download the gif from the url. Error: ${gifRawData.statusCode.toString()}";
            }
          } on Exception {
            errorMessage = "Not able to download the gif from the url.";
          }
        } else {
          errorMessage = "Not able to download the gif from the url.";
        }

        notifyListeners();
    },);

    notifyListeners();

  }
  
}
