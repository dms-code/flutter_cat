
import 'dart:typed_data';

import 'package:flutter_cat/model/cat_gif.dart';
import 'package:flutter_cat/repository/catgif_repository.dart';
import 'package:flutter_cat/util/response.dart';
import 'package:http/http.dart' as http;


class GifViewPresenter {

  bool isLoading = false;
  late CatGifRepository _repository;

  GifViewPresenter(){

    _repository = CatGifRepository();

  }

  Future<Response<Uint8List>> getRandomCat() async{

    Response<CatGif> resp = await _repository.get();

     if(!resp.hasError()){
       try{
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