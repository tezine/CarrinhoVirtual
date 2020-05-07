
import 'package:carrinhovirtual/entities/restinpeace/ecartitem.dart';
import 'package:carrinhovirtual/entities/restinpeace/eproduct.dart';
import 'package:carrinhovirtual/entities/restinpeace/esearch.dart';
import 'package:carrinhovirtual/services/restinpeace/search_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class VCartCode extends ChangeNotifier{

  String currentText = "";
  final txtProductController = TextEditingController();
  List<ECartItem> cartList=new List<ECartItem>();
  final suggestionController=SuggestionsBoxController();
  List<EProduct> suggestions = [
//    new EProduct(name: 'abacaxi',id: "dkfdfh"),
    //new EProduct(name: 'abobora',id: "sfdfsdfh")
    ];

  VCartCode(){
    //cartList.add(new ECartItem(id:"dkfhdf",name: 'Item 1'));
  }

  void onBtnAddClicked(){

  }

  void onBtnMenuClicked(){

  }

  Future<List<EProduct>> onTextChanged(String txt)async {
      //suggestions.clear();
      var list=new List<EProduct>();
      print('text changed ${txt}');
      if(txt.length<3)return list;
      list=await SearchService.search(new ESearch(text: txt,creationDateUTC: DateTime.now().toUtc()));
      print('list length: ${list.length}');
      suggestionController.open();
      suggestionController.resize();
      notifyListeners();
      return list;
  }

  void onItemSubmitted(BuildContext context, EProduct item){
    print('subbmit');
    txtProductController.text=item.name;
    cartList.add(new ECartItem(id: item.id,name: item.name,amount: item.amount, unitPrice: item.unitPrice,totalPrice: item.totalPrice));
    Navigator.pop(context);
    notifyListeners();
  }

  @override
  void dispose() {
    print('cart dispose.............................');
    txtProductController.dispose();
    super.dispose();
  }
}