import 'package:flutter_cat/model/cat.dart';
import 'package:flutter_cat/util/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
group("Cat Repository", () {
  test('Request git from CaasService', () async {
        Injector injector = Injector();

        await injector.init();
        
        var response = await injector.catRepository.get(Cat(type:CatType.gif, tag: "cute", label: "azumo"));
          
        expect(response.hasError(), false);
        expect(response.getValue()!.url == "",  false);
        
        
    });
});

}
