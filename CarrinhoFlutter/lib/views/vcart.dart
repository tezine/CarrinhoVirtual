import 'package:carrinhovirtual/entities/restinpeace/eproduct.dart';
import 'package:carrinhovirtual/views/vcart.code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class VCart extends StatefulWidget {
  @override
  _VCartState createState() => _VCartState();
}

class _VCartState extends State<VCart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> added = [];
  bool showWhichErrorText = false;

  _VCartState() {}

  @override
  Widget build(BuildContext context) {
    final code = Provider.of<VCartCode>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        automaticallyImplyLeading: true,
        title: Text('Carrinho Virtual'),
      ),
      body: _buildListView(code),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[800],
        onPressed: () => _showDialog(code),
        child: const Icon(Icons.add),
        tooltip: 'Adicionar',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.deepPurple[800],
        child: _buildBottomAppBarContents(code),
      ),
    );
  }

  Widget _buildListView(VCartCode code) {
    //final items = List<String>.generate(100, (i) => "Item ${i + 1}");

    return Scrollbar(
      child: ListView.builder(
        itemCount: code.cartList.length,
        itemBuilder: (context, index) {
          final item = code.cartList[index];

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item.id),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                code.cartList.removeAt(index);
              });

              // Then show a snackbar.
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("${item.name} removido")));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(
                title: Text(item.amount.toString()+" " +item.name),
              subtitle: Text('Valor unitário: ${item.unitPrice}. Valor total: ${item.totalPrice}'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomAppBarContents(VCartCode code) {
    return Row(
      children: [
        IconButton(
          tooltip: MaterialLocalizations
              .of(context)
              .openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () => code.onBtnMenuClicked(),
        ),
        //        const Spacer(),
        //        IconButton(
        //          tooltip: 'Search',
        //          icon: const Icon(Icons.search),
        //          onPressed: () {
        //            print('Search button pressed');
        //          },
        //        ),
        //        IconButton(
        //          tooltip: 'Favorite',
        //          icon: const Icon(Icons.more_vert),
        //          onPressed: () {
        //            print('Favorite button pressed');
        //          },
        //        ),
      ],
    );
  }

  Future<void> _showDialog(VCartCode code) async {
    code.txtProductController.clear();
    var dlg=await showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            child: Container(
              height: 400,
              child: SizedBox.expand(child: Column(children: [_buildTextField(context, code)])),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
    return dlg;
  }

  _buildTextField(BuildContext context, VCartCode code) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          controller: code.txtProductController,
          decoration: InputDecoration(
              labelText: "Produto"
          )

      ),
      suggestionsBoxController: code.suggestionController,
      suggestionsCallback: (pattern) async {
        return await code.onTextChanged(pattern);
      },
      noItemsFoundBuilder: ,
      itemBuilder: (context, EProduct suggestion) {
        var txt= suggestion.name;
        return Listener(
          child: ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(txt),
            subtitle: Text('Valor unitário: ${suggestion.unitPrice}. Valor total: ${suggestion.totalPrice}'),
          ),
          onPointerDown: (item) {
            code.onItemSubmitted(context, suggestion);
            //print('selecinou ${suggestion.name}');
          },
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      onSuggestionSelected: (EProduct suggestion) {
        //nem chega aqui
      },
    );
  }

//  _buildTextField(BuildContext context,VCartCode code ) {
//      var txtField= AutoCompleteTextField<EProduct>(
//        key: key,
//        decoration: new InputDecoration(errorText: "Produto"),
//        controller: code.txtProductController,
//        suggestions: code.suggestions,
//        textChanged: (txt) async => await code.onTextChanged(txt),
//        clearOnSubmit: true,
//        //      itemSubmitted: (item) => code.onItemSubmitted(item),
//        itemBuilder: (context, suggestion) {
//          return Listener(
//              onPointerDown: (item) {
//                code.onItemSubmitted(suggestion);
//                //print('selecinou ${suggestion.name}');
//              },
//              child: new Padding(child: new ListTile(title: new Text(suggestion.name), trailing: new Text("Stars: ${suggestion.id}")), padding: EdgeInsets.all(8.0)));
//        },
//        //      itemSorter: (a, b) => a.name == b.name ? 0 : a.name.compareTo(b.name)==true ? -1 : 1,
//        itemFilter: (suggestion, input) => suggestion.name.toLowerCase().startsWith(input.toLowerCase()),
//      );
//      code.txtField=txtField;
//    return txtField;
//  }
}
