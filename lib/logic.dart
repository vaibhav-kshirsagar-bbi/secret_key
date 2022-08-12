// Logic

String getInitVector(String str) {

  String substr='';

  try{
    substr=str.substring(str.length-4,str.length);
  }catch(e){
    return '';
  }

  String output='';
  int n= 4; //int.parse( (int.parse( str[str.length-4] ) /2).toString() );

  for(int k=0,i=0;k<substr.length;k++,i+=n)
  {
    try{
      i+= int.parse( substr[k] ) ;
      output += str.substring(i,i+n)+' ';
    }catch(e){
      return '';

    }

  }
  output= output.split(' ').reversed.join('');
  return output;

}

String getSecretKey(String str) {
  String substr='';
  try{
     substr=str.substring(str.length-4,str.length);

  }catch(e){
    return '';

  }
  String output='';
  int n= 8; //int.parse( str[str.length-4] );

  for(int k=0,i=0;k<substr.length;k++,i+=n)
  {
    try{
      i+= int.parse( substr[k] ) ;
      output += str.substring(i,i+n);
    }catch(e){
      return '';

    }

  }
  return output ;

}