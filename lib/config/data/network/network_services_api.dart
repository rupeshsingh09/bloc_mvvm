import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean/config/data/exception/app_exceptions.dart';
import 'package:bloc_clean/config/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
class NetworkServicesApi  implements BaseApiServices{
  @override
  // us file ka function yha call krke esme logig likhenge
  // ye getapi ka code h
  Future<dynamic> getApi(String url) async{

    dynamic jsonResponse;
try{

  final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

  jsonResponse = returnResponse(response);
  if(response.statusCode == 200){

  }
} on SocketException {
  // NoInternetException class jo bnye te ysko call kiye h
  throw NoInternetException('');
} on TimeoutException{
  throw FetchDataException('Time out try again');
}
return jsonResponse;
}


  @override
  // us file ka function yha call krke esme logig likhenge
  // ye delete api ka code h
  Future<dynamic> deleteApi(String url) async{

    dynamic jsonResponse;
    try{

      final response = await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      if(response.statusCode == 200){

      }
    } on SocketException {
      // NoInternetException class jo bnye te ysko call kiye h
      throw NoInternetException('');
    } on TimeoutException{
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

// ye postapi ka code h
  @override
  // us file ka function yha call krke esme logig likhenge
  Future<dynamic> postApi(String url, var data) async{

    dynamic jsonResponse;
    try{

      final response = await http.post(Uri.parse(url),
      body:data
      ).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
      if(response.statusCode == 200){

      }
    } on SocketException {
      // NoInternetException class jo bnye te ysko call kiye h
      throw NoInternetException('');
    } on TimeoutException{
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }



  // apne hisab se resoinse  set kr skte h with msg
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException('Error communiton with server' + response.statusCode.toString());

        default:
          throw UnauthorisedException();
    }
  }
  
}