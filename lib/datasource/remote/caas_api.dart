import 'dart:convert';

import 'package:flutter_cat/datasource/data_source.dart';
import 'package:flutter_cat/datasource/remote/caas_dto.dart';
import '../../util/response.dart';

import 'package:http/http.dart' as http;

/// The CAAS api implementation
///
/// [BaseURL] = https://cataas.com/cat
///
class CaasAPI extends DataSource<CaasDTO> {
  final String _apiBaseUrl = "https://cataas.com/cat";

  /// Returns a image or gif depending of the filter parameter
  ///
  /// [filter] - a CAASDTO object with type image or gif
  ///
  /// get(CaasDTO.filter(CaasType.gif))
  ///
  ///
  @override
  Future<Response<CaasDTO>> get(CaasDTO caasDTO) async {
    StringBuffer url = StringBuffer(_apiBaseUrl);

    // Check the dto image type and update the url with the correct path
    if (caasDTO.imageType == CaasType.gif) {
      url.write("/gif");
    } else if (caasDTO.tag != null && caasDTO.tag!.isNotEmpty) {
      url.write("/${caasDTO.tag!}");
    }

    if (caasDTO.label != null && caasDTO.label!.isNotEmpty) {
      url.write("/says/${caasDTO.label!}");
    }

    //Add parameters to url
    url.write("?");

    if (caasDTO.filter != null) {
      url.write("filter=${caasDTO.filter!}&");
    }

    url.write("json=true");

    try {
      // Send a get request to the server
      var response = await http.get(Uri.parse(url.toString()));

      // Check if the response is http 200 OK
      if (response.statusCode == 200) {
        try {
          // Decode the JSON data returned by the API
          var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;

          decodedResponse["type"] = caasDTO.imageType;

          // Update the image/gif URL with the BaseURL
          decodedResponse["url"] =
          "https://cataas.com${decodedResponse["url"]}";

          return Response<CaasDTO>(CaasDTO(decodedResponse));
        } on Exception {
          return Response<CaasDTO>.error(
              "An error occurred to parse data from the CAAS service. Response: ${response.body}");
        }
      } else {
        return Response<CaasDTO>.error(
            "An error occurred to fetch data from the CAAS service. Status Code: ${response.statusCode}");
      }
    } on Exception {
      return Response<CaasDTO>.error(
          "An error occurred to fetch data from the CAAS service.");
    }
  }
}
