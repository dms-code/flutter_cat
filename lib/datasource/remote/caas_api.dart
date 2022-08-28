import 'dart:convert';

import 'package:flutter_cat/datasource/data_source.dart';
import 'package:flutter_cat/datasource/remote/caas_dto.dart';
import '../../util/response.dart';

import 'package:http/http.dart' as http;

class CaasAPI extends DataSource<CaasDTO>{

  final String _apiBaseUrl = "https://cataas.com/cat";
  
  @override
  Future<Response<CaasDTO>> get(CaasDTO filter) async {
    String url = _apiBaseUrl;

    if(filter.type == CaasType.gif){
      url += "/gif?json=true";
    }
    else{
      url += "?json=true";
    }

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        try {
          var decodedResponse = jsonDecode(
              utf8.decode(response.bodyBytes)) as Map;

          decodedResponse["type"] = filter.type;
          decodedResponse["url"] =
          "https://cataas.com${decodedResponse["url"]}";

          return Response<CaasDTO>(CaasDTO(decodedResponse));
        } on Exception {
          return Response<CaasDTO>.error(
              "An error occurred to parse data from the CAAS service. Response: ${response
                  .body}");
        }
      }
      else {
        return Response<CaasDTO>.error(
            "An error occurred to fetch data from the CAAS service. Status Code: ${response.statusCode}");
      }
    } on Exception{
      return Response<CaasDTO>.error(
          "An error occurred to fetch data from the CAAS service.");
    }

  }
  

}