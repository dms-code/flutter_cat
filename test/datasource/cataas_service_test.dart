import 'package:flutter_cat/datasource/remote/cataas_api.dart';
import 'package:flutter_cat/datasource/remote/cataas_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

void main() {
  
group("CAAS", () {
  test('Fetch a Random Gif from Caas Service ', () async {

        final dio = Dio(); // Provide a dio instance
        CataasDTO? result;

        try{
          result = await CataasAPI(dio).get("/gif", "", "", true);
        } on DioError catch (error) {
           // ignore: avoid_print
           print(error.message); 
        }

        expect(result?.url == "",  false);

    });

    test('Fetch a Random Image from Caas Service ', () async {

      final dio = Dio(); // Provide a dio instance

        CataasDTO? result;

        try{
          result = await CataasAPI(dio).get("", "", "", true);          
        } on DioError catch (error) {
           // ignore: avoid_print
           print(error.message); 
        }

        expect(result?.url == "",  false);

  });

  test('Fetch a Random Image by Tag from Caas Service ', () async {

      final dio = Dio(); // Provide a dio instance

        CataasDTO? result;

        try{
          result = await CataasAPI(dio).get("", "", "cute", true);          
        } on DioError catch (error) {
           // ignore: avoid_print
           print(error.message); 
        }

        expect(result?.url == "",  false);

  });

  test('Add label to a Random Image', () async {

        final dio = Dio(); // Provide a dio instance

        CataasDTO? result;

        try{
          result = await CataasAPI(dio).get("/gif", "", "/says/azumo", true);
        } on DioError catch (error) {
           // ignore: avoid_print
           print(error.message); 
        }

        expect(result?.url == "",  false);

  });

  test('Fetch a Random image with all filters', () async {

        final dio = Dio(); // Provide a dio instance

        CataasDTO? result;

        try{
          result = await CataasAPI(dio).get("/gif", "/says/azumo", "cute", true);
        } on DioError catch (error) {
           // ignore: avoid_print
           print(error.message);
        }

        expect(result?.url == "",  false);

  });
});

}
