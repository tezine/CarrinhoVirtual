import 'package:carrinhovirtual/entities/restinpeace/euser.dart';
import 'package:carrinhovirtual/services/restinpeace/users_service.dart';
import 'package:flutter/material.dart';

class VConfigCode extends ChangeNotifier{
  final txtNameController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtMobileController= TextEditingController();
  final txtPhoneController=TextEditingController();
  EUser eUser=new EUser();


  Future<EUser> getByID(String userID) async{
    eUser= await UsersService.getByID(userID);
    print('chegou client ${eUser.name}');
    txtNameController.text=eUser.name;
    txtEmailController.text=eUser.email;
//    txtMobileController.text=eCompany.mobile;
//    txtPhoneController.text=eCompany.phone1;
    notifyListeners();
    return eUser;
  }

  void save(GlobalKey<FormState> formKey )async{
    print('clicou em save: ${txtNameController.text}');
//    bool isFormValid=formKey.currentState.validate();
//    print('isValid $isFormValid');
//    eCompany.name=txtNameController.text;
//    eCompany.email=txtEmailController.text;
//    eCompany.mobile=txtEmailController.text;
//    eCompany.phone1=txtPhoneController.text;
  }
}