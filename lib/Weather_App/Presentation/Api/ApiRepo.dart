import 'package:dio/dio.dart';

class Apirepo{
  Dio dio=Dio() ;
  String? url ;
  Map<String,dynamic>?payload ;
  Apirepo({this.url,this.payload});
  void getData(
    {
      Function(dynamic)?onLoading,
      Function(Map<String,dynamic>data)?onSuccess,
      Function(dynamic)?onError
    }
  ){
    dio.get(url!,queryParameters: payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
        
      }
    }).catchError((error){
    
        onError!(error);
      
    });
  }
} 