
import '../util/response.dart';

/// The base repository class
abstract class Repository<T>{

  Future<Response<T>> get();

}