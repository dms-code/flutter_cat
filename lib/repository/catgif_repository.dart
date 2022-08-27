
import 'package:flutter_cat/datasource/data_source.dart';
import 'package:flutter_cat/datasource/remote/caas_api.dart';
import 'package:flutter_cat/datasource/remote/caas_dto.dart';
import 'package:flutter_cat/model/cat_gif.dart';
import 'package:flutter_cat/repository/repository.dart';

import '../util/response.dart';

class CatGifRepository implements Repository<CatGif>{
  
  late DataSource<CaasDTO> _remoteCaasSevice;

  CatGifRepository(){
    _remoteCaasSevice = CaasAPI();
  }
  
  @override
  Future<Response<CatGif>> get() async {
    
    Response<CaasDTO> response =  await _remoteCaasSevice.get(CaasDTO.filter(CaasType.gif));

    if(!response.hasError() && response.getValue() != null){

        return Response<CatGif>(CatGif(response.getValue()!.url!));

    }
    else{

        return Response.error(response.getError());

    }
  }

}