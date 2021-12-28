import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  static const token = 'token' ;
  static const email = 'email' ;
  static const phone = 'phone' ;
  static const firstName = 'first_name' ;
  static const lastName = 'last_name' ;

  static Future<SharedPreferences> _getStorage() async
  {
    return SharedPreferences.getInstance();
  }

  static Future<String?> getString( String name ) async
  {
    SharedPreferences storage = await _getStorage() ;
    return storage.getString( name ) ;
  }

  static Future<Map?> getJson( String name ) async
  {
    String? str = await getString(name);

    if( str == null )
    {
      return null ;
    }
    return jsonDecode( str ) ;
  }

  static Future<void> set( String key ,dynamic value ) async
  {
    SharedPreferences storage = await _getStorage() ;

    if( value.runtimeType == String)
    {
      storage.setString( key ,value ) ;
    }
    else if( value.runtimeType == Double)
    {
      storage.setDouble( key ,value ) ;
    }
    else if( value.runtimeType == Bool )
    {
      storage.setBool( key ,value ) ;
    }
    else if( value.runtimeType == int )
    {
      storage.setInt( key ,value ) ;
    }
    else
    {
      storage.setString( key ,jsonEncode(value) ) ;
    }

  }

  static Future<void> remove( String key ) async
  {
    SharedPreferences storage = await _getStorage() ;
    storage.remove(key) ;
  }

  static Future<void> clear() async
  {
    SharedPreferences storage = await _getStorage() ;

    storage.clear() ;
  }

}