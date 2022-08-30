import 'package:flutter_cat/datasource/data_source.dart';
import 'package:flutter_cat/datasource/remote/caas_dto.dart';
import 'package:flutter_cat/model/cat_gif.dart';
import 'package:flutter_cat/repository/repository.dart';
import '../util/response.dart';

/// The repository that holds gif information
class CatGifRepository implements Repository<CatGif>{
  
  late final DataSource<CaasDTO> _remoteCaasService;

  CatGifRepository(this._remoteCaasService);
  
  /// Returns the gif url from the remote api
  @override
  Future<Response<CatGif>> get() async {
    
    //Get gif data from the API
    Response<CaasDTO> response =  await _remoteCaasService.get(CaasDTO.filter(CaasType.gif));

    if(!response.hasError() && response.getValue() != null){

        //Data Mapping from the DTO to the Model
        return Response<CatGif>(CatGif(response.getValue()!.url!));

    }
    else{

        return Response.error(response.getError());

    }
  }

}