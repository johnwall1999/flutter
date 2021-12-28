import 'package:flutter_app/Config/Routes.dart';
import 'package:flutter_app/Lib/Storage.dart';
import 'package:flutter_app/Services/ApiService.dart';
import 'package:get/get.dart';

class AuthService
{

  AuthService()
  {}

  Future<bool> _hasToken() async
  {
    var token = await Storage.getString( Storage.token ) ;
    return token?.isNotEmpty ?? false  ;
  }

  Future<bool> _validateToken( ApiService service ) async
  {
    if( await _hasToken() == false )
    {
      return false ;
    }
    var res = await service.post( url : "/api/user/user" ) ;
    return res.runtimeType == GoodResponse ;
  }

  // ========== Private and Public method separator ============= //

  Future<void> login( String _email ,String _token ,String _phone ,String _firstName ,String _lastName ) async
  {
    Storage.set(Storage.email, _email) ;
    Storage.set(Storage.token, _token) ;
    Storage.set(Storage.phone, _phone) ;
    Storage.set(Storage.firstName, _firstName) ;
    Storage.set(Storage.lastName, _lastName) ;
    Get.offAndToNamed( Routes.DASHBOARD ) ;
  }

  Future<void> logout({ ApiService? service }) async
  {
    Storage.remove(Storage.email) ;
    Storage.remove(Storage.token) ;
    Storage.remove(Storage.phone) ;
    Storage.remove(Storage.firstName) ;
    Storage.remove(Storage.lastName) ;
    if( service != null )
    {
      await service.post( url : "/api/user/logout" ) ;
      await service.updateAuthToken() ;
    }
    Get.offAllNamed( Routes.LOGIN ) ;
  }

  Future<bool> isLoggedIn( ApiService service ) async
  {
    return _validateToken( service ) ;
 }

  Future<void> autoLogin( ApiService service ) async
  {
    if( await _validateToken( service ) )
    {
      Get.offAndToNamed( Routes.DASHBOARD ) ;
    }
  }

  Future<void> autoLogout( ApiService service ) async
  {
    if( await _validateToken( service ) == false )
    {
      logout( service: service ) ;
    }
  }

}
