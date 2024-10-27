/*
import 'package:weather_app/Weather_App/Presentation/Api/ApiRepo.dart';
import 'package:weather_app/Weather_App/Presentation/Model/CW_model.dart';
import 'package:weather_app/Weather_App/Presentation/Model/FCW.dart';
class Weatherservices {
  String baseurl = "https://api.openweathermap.org/data/2.5";
  String apikey = "appid=6dd1f63bd20f115d9321b06ab03f1f10";
  String? City;
  void getCurrentWeatherData(

      {
      Function(dynamic)? onLoading,
      Function(CW)? onSuccess,
      Function(dynamic)? onError
      }
      ) {
        final url = "$baseurl/weather?q=$City&$apikey";
      Apirepo(url: url,payload: null).getData(
onLoading: (p0) => onLoading!(p0),
onSuccess: (data) => onSuccess!(CW.fromJson(data),
),onError: (error) => onError!(error),

      );
      }                                   


 void Getfivethreehourforcast(

      {
      Function(dynamic)? onLoading,
      Function(List<FCW>)? onSuccess,
      Function(dynamic)? onError
      }
      ) {
        final url = "$baseurl/forecast?q=$City&$apikey";
      Apirepo(url: url,payload: null).getData(
onLoading: (p0) => onLoading!(p0),
onSuccess: (data) => onSuccess!(CW.fromJson(data),
),onError: (error) => onError!(error),

      );
                                       
      }
}*/