
/// A helper class that holds a model or error message
/// Should be used in any kind of network operation
class Response<T>{

  T? _value;
  String? _error;

  Response(this._value);
  Response.error(this._error);

  T? getValue(){
    return _value;
  }

  String? getError(){
    return _error;
  }

  bool hasError(){
    return (_error != null);
  }

}