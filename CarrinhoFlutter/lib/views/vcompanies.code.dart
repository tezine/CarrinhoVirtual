
import 'package:carrinhovirtual/codes/defines.dart';
import 'package:carrinhovirtual/codes/routes.dart';
import 'package:carrinhovirtual/entities/restinpeace/eusercompany.dart';
import 'package:carrinhovirtual/services/restinpeace/userscompanies_service.dart';
import 'package:flutter/material.dart';

class VCompaniesCode extends ChangeNotifier{

  List<EUserCompany> list=new List<EUserCompany>();
  final txtController = TextEditingController();

  void getCompanies()async{
    list=await UsersCompaniesService.getAllByUserID(Defines.userID);
    notifyListeners();
  }

  Future<void> onItemClicked(BuildContext context, EUserCompany eUserCompany) async{
    Defines.companyID=eUserCompany.companyId;
    Navigator.of(context).pushNamed(Routes.cart);
  }

  void onBtnAddCompanyClicked()async{
      var eUserCompany=new EUserCompany(companyName: txtController.text.trim(),creationDateUTC: DateTime.now().toUtc());
      eUserCompany.userId=Defines.userID;
      await UsersCompaniesService.addCompany(eUserCompany);
      getCompanies();
  }
}