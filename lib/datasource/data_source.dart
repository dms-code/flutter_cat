import 'package:flutter_cat/util/response.dart';

abstract class DataSource<T>{

  Future<Response<T>> get(T filter);

}