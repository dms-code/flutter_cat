import 'package:flutter_cat/datasource/data_source.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'cataas_dto.dart';

part 'cataas_api.g.dart';

/// The CAAS api implementation
///
/// [BaseURL] = https://cataas.com/cat
///
@RestApi(baseUrl: "https://cataas.com")
abstract class CataasAPI extends DataSource<CataasDTO> {
  
  factory CataasAPI(Dio dio, {String baseUrl}) = _CataasAPI;

  /// Return a cat image depending of the filter
  ///
  /// [type] - Type of the image gif or image
  /// [tag] - A tag category ex: cute
  /// [says] - A message to be added to the image
  /// [json] - Return the data in json format
  ///
  @GET("/cat{type}{says}")
  Future<CataasDTO> get(
      @Path("type") String type,
      @Path("says") String says,
      @Query("t") String tag,
      @Query("json") bool json
  );


}
