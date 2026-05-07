

class AppExceptions implements Exception{

  final _message;
  final _prefix ;
  // yh constructor hai jisme ki value pass kr rhe h
  AppExceptions([this._message, this._prefix]);

  // override method hai yh
  @override
  String toString(){
    return '$_message$_prefix';
  }
}

// noInterException msg ke liye class bnye h
class NoInternetException extends AppExceptions{
  // no internet ka constructor create krenge
  NoInternetException([String? message]) : super(message, 'No Internet Connection');
}

// UnauthorisedException msg ke liye class bnye h
class UnauthorisedException extends AppExceptions{
  //  constructor create krenge
  UnauthorisedException([String? message]) : super(message, 'Request time out');
}

// RequestTimeOutException msg ke liye class bnye h
class RequestTimeOutException extends AppExceptions{
  // constructor create krenge
  RequestTimeOutException([String? message]) : super(message, 'You do not have to acees to this');
}


// FetchDataException msg ke liye class bnye h
class FetchDataException extends AppExceptions{
  //  constructor create krenge
  FetchDataException([String? message]) : super(message, '');
}

// esme apne according koi v exception handle kr skte hai