import 'package:flutter_cat/datasource/remote/cataas_api.dart';
import 'package:flutter_cat/datasource/remote/cataas_dto.dart';
import 'package:flutter_cat/model/cat.dart';
import 'package:flutter_cat/repository/repository.dart';
import 'package:logger/logger.dart';
import '../util/response.dart';
import 'package:dio/dio.dart' as dio;

/// The repository class that handle the access to CAAS data source
class CatRepository implements Repository<Cat>{

  late final CataasAPI _remoteCaasService;
  final Logger _logger;

  CatRepository(this._remoteCaasService, this._logger);

  /// Return gif url from the remote api
  @override
  Future<Response<Cat>> get(Cat filter) async {

    try{
      
      //Get image data from the API
      CataasDTO dto =  await _remoteCaasService.get(
        filter.type == CatType.gif ? "/gif" : "", 
        filter.label.isNotEmpty ? "/says/${filter.label}" : "", 
        filter.tag, 
        true
      );

      dto.imageType = filter.type == CatType.image ? CataasType.image : CataasType.gif;

      _logger.d(dto.toJson());

      //Data Mapping from the DTO to the Model
      return Response<Cat>(dto.toCat());

    } on dio.DioError catch(error){
      _logger.d(error.message);
      return Response.error(error.message);
    }
  }

}