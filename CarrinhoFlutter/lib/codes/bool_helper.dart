
class BoolHelper{

  static bool convertStringToBool(String txt){
    if(txt.toLowerCase()=='true' || txt=='1')return true;
    return false;
  }
}