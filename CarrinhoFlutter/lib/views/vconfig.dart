import 'package:carrinhovirtual/codes/defines.dart';
import 'package:carrinhovirtual/entities/restinpeace/euser.dart';
import 'package:carrinhovirtual/themes/theme_default.dart';
import 'package:carrinhovirtual/views/vconfig.code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VConfig extends StatefulWidget {
  @override
  _VConfigState createState() => _VConfigState();
}

class _VConfigState extends State<VConfig> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    print('(VConfig)dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<VConfigCode>(
        builder: (context, code, child) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                  backgroundColor: ThemeDefault.colorBackground,
                  appBar: AppBar(
                    title: Text('Config'),
                    bottom: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.settings), text: 'General',),
                        Tab(icon: Icon(Icons.timer), text: 'Timetable',),
                      ],),
                    actions: <Widget>[
                      FlatButton.icon(
                        label: Text('Save'),
                        icon: const Icon(Icons.save),
                        onPressed: () async => await code.save(_formKey),
                      ),
                    ],
                  ),
                  body: FutureProvider<EUser>(
                      create: (context) async {
                        var result = await code.getByID(Defines.userID);
                        setState(() {
                          _loading = false;
                        });
                        return result;
                      },
                      catchError: null,
                      child: Form(
                          key: _formKey,
                          child: _buildTabLayout(context, code))
                  )
              )
          );
        },
      );
  }

  Widget _buildTabLayout(BuildContext context, VConfigCode code) {
    return TabBarView(
      children: [
        _buildLayout(context, code),
        Icon(Icons.directions_transit),
      ],
    );
  }

  Widget _buildLayout(BuildContext context, VConfigCode oldCode) {
    print('(VConfig)_buildLayout..............');
    if (_loading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else
      return SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Card(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Company', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Consumer<VConfigCode>(
                                            builder: (context, code, child) {
                                              return TextFormField(
                                                  controller: code.txtNameController,
                                                  validator: (value) {
                                                    if (value.length < 3) return 'Invalid name';
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    icon: const Icon(Icons.subject),
                                                    labelText: 'Name *',
                                                  ));
                                            }
                                        )
                                    ),
                                    Expanded(
                                        child: Consumer<VConfigCode>(
                                            builder: (context, code, child) {
                                              return TextFormField(
                                                  controller: code.txtEmailController,
                                                  validator: (value) {
                                                    if (value.length < 3) return 'Invalid email';
                                                    if (!value.contains('@')) return 'Invalid email';
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    icon: const Icon(Icons.email),
                                                    labelText: 'E-mail *',
                                                  ));
                                            }
                                        )
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Consumer<VConfigCode>(
                                            builder: (context, code, child) {
                                              return TextFormField(
                                                  controller: code.txtMobileController,
                                                  decoration: InputDecoration(
                                                    icon: const Icon(Icons.mobile_screen_share),
                                                    labelText: 'Mobile',
                                                  ));
                                            }
                                        )
                                    ),
                                    Expanded(
                                        child: Consumer<VConfigCode>(
                                            builder: (context, code, child) {
                                              return TextFormField(
                                                  controller: code.txtPhoneController,
                                                  decoration: InputDecoration(
                                                    icon: const Icon(Icons.phone),
                                                    labelText: 'Phone',
                                                  ));
                                            }
                                        )
                                    )
                                  ],
                                ),
                              ])
                      )
                  )
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Card(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Payment methods', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)
                              ]
                          )
                      )
                  )
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Card(
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Address', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)
                              ]
                          )
                      )
                  )
              ),
            ]
        ),
      );
  }
}