import 'package:flutter_cat/datasource/remote/caas_api.dart';
import 'package:flutter_cat/repository/catgif_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
group("GIF Repository", () {
  test('Request git from CaasService', () async {

        CatGifRepository(CaasAPI()).get().then((response) {
          
          expect(response.hasError(), false);
          expect(response.getValue()!.url == "",  false);

        });
        
    });
});

}
