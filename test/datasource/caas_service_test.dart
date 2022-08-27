import 'package:flutter_cat/datasource/remote/caas_api.dart';
import 'package:flutter_cat/datasource/remote/caas_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
group("CAAS", () {
  test('Fetch a Random Gif from Caas Service ', () async {

        final filter = CaasDTO.filter(CaasType.gif);

        var response = await CaasAPI().get(filter);

        expect(response.hasError(), false);

        expect(response.getValue()!.url! == "",  false);
    });

    test('Fetch a Random Image from Caas Service ', () async {

      final filter = CaasDTO.filter(CaasType.image);

      var response = await CaasAPI().get(filter);

      expect(response.hasError(), false);

      expect(response.getValue()!.url! == "",  false);

  });
});

}
