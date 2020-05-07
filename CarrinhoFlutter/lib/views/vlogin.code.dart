
import 'package:carrinhovirtual/codes/defines.dart';
import 'package:carrinhovirtual/codes/routes.dart';
import 'package:carrinhovirtual/entities/restinpeace/euser.dart';
import 'package:carrinhovirtual/services/restinpeace/users_service.dart';
import 'package:flutter/material.dart';

class VLoginCode extends ChangeNotifier{
  //EUser _eUser=new EUser();
  bool invalidEmail=false;
  bool invalidPassword=false;
  bool termsAccepted=false;
  final txtEmailController = TextEditingController();
  final txtPasswordController = TextEditingController();

  VLoginCode(){
    txtEmailController.text='bruno@tezine.com';
    txtPasswordController.text='tata';
  }

  void setEmail(String email){
    //_eUser.email=email;
//    if(!ValidationHelper.isEmailValid(email))invalidEmail=true;
//    else invalidEmail=false;
  }

  void setPassword(String password){
    //_eUser.password=password;
  }

  Future<void> btnLoginClicked(BuildContext context) async{
    try {
      var eUser = new EUser(email: txtEmailController.text, password: txtPasswordController.text);
      eUser = await UsersService.authenticate(eUser);
      print("id ${eUser.id}");
      Defines.userID = eUser.id;
      if (eUser.id.length > 0) Navigator.of(context).pushNamed(Routes.companies);
    }catch(ex){

    }

  }
}