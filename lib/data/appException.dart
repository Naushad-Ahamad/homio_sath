
class AppExceptions implements Exception{
  final _message;
  final _prefix;

  AppExceptions([this._message,this._prefix]);
  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super (message,'Error During Communication');
}
class BadRequestException extends AppExceptions{
  BadRequestException([String? message]) : super (message,'Invailid Request');
}
class NoDataException extends AppExceptions{
  NoDataException([String? message]) : super (message,'Unable To Fetch Data');
}
class UnauthorisedException extends AppExceptions{
  UnauthorisedException([String? message]) : super (message,'Unauthorised Request');
}

class InvalidInpurException extends AppExceptions{
  InvalidInpurException([String? message]) : super (message,'Invalid Input : ');
}