// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Lib/Storage.dart';
import 'package:get/get.dart' hide Response ;

class ApiService {

  final String BaseUrl = "https://capitalcore.net" ;
  Dio? _dio ;
  String? _token ;

  ApiService() {
    _initial_dio() ;
  }

  _initial_dio() async {
    await updateAuthToken() ;
    _dio = Dio() ;
    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          if ( _token != null && _token != '' ) {
            request.headers['Authorization'] = 'Bearer $_token';
          }
          request.headers['Content-type'] = "application/json";
          request.headers['Accept'] = "application/json";
          return handler.next(request);
        },
      ),
    );
  }

  GoodResponse _handleGoodResponse( Response? response ) => GoodResponse(ok : true, status : response?.statusCode ?? 200 , data: response?.data) ;

  BadResponse _handleBadResponse( Response? response ) {

    int? statusCode = response?.statusCode ;

    print( statusCode ) ;

    switch( statusCode )
    {
      case 500 :
        print( response?.data ) ;
        return BadResponse( ok : false, status : 500 ,data: {} ,error : "Something went wrong please try again later!") ;
      case 401 :
        Get.offAndToNamed( Routes.LOGOUT ) ;
        return BadResponse( ok : false, status : 401 ,data: {}, error : "Authorization failed!") ;
      case 400 :
        if( response != null )
        {
          Map<String, dynamic> data = response.data ;
          return BadResponse( ok : false, status : 400 ,data: {} ,error : data['message'] ) ;
        }
      break ;
      case 422 :
        if( response != null )
        {
          Map<String, dynamic> data = response.data ;
          return BadResponse( ok : false, status : 422 ,data: {} , error : data['errors'].values.elementAt(0)[0] ) ;
        }
      break ;
    }
    return BadResponse( ok : false, status : 400 ,data: {} , error :  'No response from server!') ;
  }

  // ============== Private and Public ============== //

  Future<Dio> getDioObject() async {
    if( _dio == null )
    {
      await Future.delayed( const Duration( milliseconds: 100 ) ) ;
      return getDioObject() ;
    }
    return _dio ?? Dio() ; // Dio() will never created
  }

  Future<void> updateAuthToken( [ String?token ] ) async {
    if( token == null ) {
      _token = await Storage.getString( Storage.token ) ;
    }
    else {
      _token = token ;
    }
  }

  Future< ApiResponse > get( String url ) async {
    try
    {
      var _dio = await getDioObject() ;
      var response = await _dio.get( BaseUrl + url );
      return _handleGoodResponse( response ) ;
    }
    on DioError catch ( error )
    {
      return _handleBadResponse( error.response ) ;
    }
  }

  Future< ApiResponse > getWithDelay( String url ) async {

    var start = DateTime.now().millisecondsSinceEpoch ;

    var res = await get( url ) ;

    var end = DateTime.now().millisecondsSinceEpoch ;

    var dif = end - start ;

    if( dif < 1600 )
    {
      // it took less than on second
      await Future.delayed( Duration( milliseconds: 1600 - dif ) ) ;
    }

    return res ;
  }

  Future< ApiResponse > post({ required String url ,dynamic payload }) async {
    try
    {
      var response = await _dio?.post( BaseUrl + url ,data : payload );

      if( response?.data?['success'] ?? false )
      {
        return _handleGoodResponse( response ) ;
      }
      else
      {
        return _handleBadResponse( response ) ;
      }
    }
    on DioError catch ( error )
    {
      return _handleBadResponse( error.response ) ;
    }
  }

}

abstract class ApiResponse {

  late final bool ok  ;
  late final int status ;
  late final Map<String ,dynamic> data ;

}

class GoodResponse implements ApiResponse {

  @override
  bool ok;
  @override
  int status;

  @override
  Map<String, dynamic> data;

  GoodResponse({ required this.ok ,required this.status ,required this.data }) ;

}

class BadResponse implements ApiResponse  {

  @override
  bool ok;

  @override
  int status;

  @override
  Map<String, dynamic> data;

  final String error;

  BadResponse({ required this.ok ,required this.status ,required this.error ,required this.data }) ;

}