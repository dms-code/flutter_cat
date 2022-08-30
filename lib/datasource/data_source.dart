import 'package:flutter_cat/util/response.dart';

/// The base datasource class
abstract class DataSource<T>{

  Future<Response<T>> get(T filter);

}