class ValidationMixin {

  String? validateName( String? value ){

    if( value != null && value.length < 2 ){
      return 'Invalid name';
    }

    return null ;
  }

  String? validateEmail( String? value ){

    if( value != null && ! value.contains('@') ){
      return 'Invalid email address';
    }

    return null ;
  }

  String? validatePassword( String? value ){

    if( value != null && value.length < 6 ){
      return 'Invalid password';
    }

    return null ;
  }

}