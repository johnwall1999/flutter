import 'dart:convert';
import 'package:dio/dio.dart';

enum Methods {
  post,
  get
}

abstract class ApiCore
{
  String get url ;
  Methods? get method ;
  Map<String,dynamic> payload = {} ;
  final String base = "https://api.fxglory.biz";
  Map<String,String> headers = {
    "Accept": "application/json",
  };

  ApiCore setPayload( Map<String,dynamic> p )
  {
    payload = p ;
    return this ;
  }

  Future< Map<String,dynamic> > _get() async
  {
    try
    {
      Response result = await Dio().get( base + url ,options: Options( headers: headers ) ) ;
      return handleResponse(result) ;
    }
    on DioError catch (e)
    {
      Response? result = e.response ;
      return handleResponse(result) ;
    }
  }

  Future<Map<String,dynamic>> _post() async
  {
    try
    {
      Response result = await Dio().post( base + url ,data : FormData.fromMap(payload) ,options: Options( headers: headers ) ) ;
      return handleResponse(result) ;
    }
    on DioError catch (e)
    {
      Response? result = e.response ;
      return handleResponse(result) ;
    }
  }

  Future< Map<String,dynamic> > response() async
  {
    if( method == Methods.get )
    {
     return _get() ;
    }
    else if( method == Methods.post )
    {
      return _post() ;
    }
    else
    {
      throw "Invalid http method" ;
    }
  }

  Map<String,dynamic> handleResponse( Response? response )
  {
    if( response == null )
    {
      return {
        'ok' : true ,
        'status' : 500 ,
        'success' : false ,
        'data' : {} ,
      };
    }

    Map<String,dynamic> json = jsonDecode( response.data.toString() );

    if( response.statusCode == 200 )
    {
      return {
        'ok' : true ,
        'status' : response.statusCode ,
        'success' : json['success'] ,
        'data' : json['data'] ,
      };
    }
    else if( response.statusCode == 422 )
    {
      return {
        'ok' : false ,
        'status' : response.statusCode ,
        'success' : false ,
        'message' : json['message'] ,
        'errors' : json['errors'] ,
      };
    }
    else
    {
      return {
        'ok' : false ,
        'status' : response.statusCode ,
        'success' : json['success'] ,
        'data' : json['data'] ,
      };
    }
  }
  
}