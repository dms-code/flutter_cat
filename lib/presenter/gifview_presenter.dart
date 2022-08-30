
import 'dart:typed_data';

import 'package:flutter_cat/model/cat_gif.dart';
import 'package:flutter_cat/repository/catgif_repository.dart';
import 'package:flutter_cat/util/response.dart';
import 'package:http/http.dart' as http;

/// The presenter that intermediate communication between
/// the [GifViewPart][RecentViewPart] with the reposity [CatGifRepository] 
class GifViewPresenter {

  bool isLoading = false;
  late final CatGifRepository _repository;
  final List<CatGif> _recent = [];

  GifViewPresenter(this._repository);

  List<CatGif> getRecent() => _recent;


  /// Get a random gif cat image from [CatGifRepository]
  Future<Response<Uint8List>> getRandomCat() async{

    Response<CatGif> resp = await _repository.get();

     if(!resp.hasError()){
       try{

         _recent.add(resp.getValue()!);

         var gifRawData = await http.get(Uri.parse(resp.getValue()!.url));

         if(gifRawData.statusCode == 200) {
           return Response<Uint8List>(gifRawData.bodyBytes);
         }
         else {
           return Response<Uint8List>.error(
               "Not able to download the gif from the url. Error: ${gifRawData
                   .statusCode.toString()}");
         }
       } on Exception{
         return Response<Uint8List>.error("Not able to download the gif from the url.");
       }
     }
     else
     {
       return Response<Uint8List>.error("Not able to download the gif from the url.");
     }
  }

}