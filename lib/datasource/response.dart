
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