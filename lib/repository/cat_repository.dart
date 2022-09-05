import 'package:flutter_cat/datasource/data_source.dart';
import 'package:flutter_cat/datasource/remote/caas_dto.dart';
import 'package:flutter_cat/model/cat.dart';
import 'package:flutter_cat/repository/repository.dart';
import '../util/response.dart';

/// The repository that holds gif information
class CatRepository implements Repository<Cat>{

  late final DataSource<CaasDTO> _remoteCaasService;

  CatRepository(this._remoteCaasService);

  /// Returns the gif url from the remote api
  @override
  Future<Response<Cat>> get(Cat filter) async {

    //Get gif data from the API
    Response<CaasDTO> response =  await _remoteCaasService.get(CaasDTO.from(filter));

    if(!response.hasError() && response.getValue() != null){

      //Data Mapping from the DTO to the Model
      CaasDTO dto = response.getValue()!;
      return Response<Cat>(Cat(url: dto.url!, type: dto.imageType! == CaasType.gif ? CatType.gif : CatType.image));

    }
    else{

      return Response.error(response.getError());

    }
  }

}