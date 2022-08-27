import 'package:flutter_cat/datasource/response.dart';

abstract class DataSource<T>{

  Future<Response<T>> get(T filter);

}