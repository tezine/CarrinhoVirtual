import 'package:carrinhovirtual/views/vcompanies.code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VCompanies extends StatefulWidget {
  @override
  _VCompaniesState createState() => _VCompaniesState();
}

class _VCompaniesState extends State<VCompanies> {


  @override
  Widget build(BuildContext context) {
    final code = Provider.of<VCompaniesCode>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          automaticallyImplyLeading: false,
          title: Text('Lojas'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Adicionar',
                onPressed: () async => await _btnAddClicked(code)
            ),
          ]),
      body: _buildListView(code),
      //      floatingActionButton: FloatingActionButton(
      //        backgroundColor: Colors.red[800],
      //        onPressed:  () => _btnAddClicked(),
      //        child: const Icon(Icons.add),
      //        tooltip: 'Add',),
      //      floatingActionButtonLocation: _fabLocation,
      //      bottomNavigationBar: BottomAppBar(
      //        shape: const CircularNotchedRectangle() ,
      //        color: Colors.deepPurple[800],
      //        child: _buildBottomAppBarContents(code),
      //      ),
    );
  }

  Widget _buildListView(VCompaniesCode code) {
    if (code.list.length == 0) code.getCompanies();

    return Scrollbar(
      child: ListView.builder(
        itemCount: code.list.length,
        itemBuilder: (context, index) {
          final item = code.list[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item.companyId),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                //items.removeAt(index);
              });

              // Then show a snackbar.
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(title: Text(item.companyName), onTap: () => code.onItemClicked(context, item),),
          );
        },
      ),
    );
  }

  Future<void> _btnAddClicked(VCompaniesCode code) async {

    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Digite o nome da empresa'),
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here,
            content: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                          controller: code.txtController,
                          decoration: InputDecoration(
                            //icon: const Icon(Icons.business),
                            //hintText: 'Login',
                            labelText: 'Empresa',
                          )
                      ),
                      //_buildNewCompanyListView(code)
                    ],
                  ),
                )),
            actions: <Widget>[
              FlatButton(
                child: Text('Adicionar'),
                onPressed: () {
                  code.onBtnAddCompanyClicked();
                  Navigator.of(context).pop();
                },
              ),
            ],

          );
        }
    );
  }

  Widget _buildNewCompanyListView(VCompaniesCode code) {
    if (code.list.length == 0) code.getCompanies();

    return Scrollbar(
      child: ListView.builder(
        itemCount: code.list.length,
        itemBuilder: (context, index) {
          final item = code.list[index];

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item.companyId),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                //items.removeAt(index);
              });

              // Then show a snackbar.
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(title: Text(item.companyName), onTap: () => code.onItemClicked(context, item),),
          );
        },
      ),
    );
  }
}
