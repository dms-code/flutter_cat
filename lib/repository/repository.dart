
import '../util/response.dart';

abstract class Repository<T>{

  Future<Response<T>> get();

}