import 'package:carrinhovirtual/codes/defines.dart';
import 'package:carrinhovirtual/entities/restinpeace/eproduct.dart';
import 'package:carrinhovirtual/themes/theme_default.dart';
import 'package:carrinhovirtual/views/vlogin.code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';


class VLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final code = Provider.of<VLoginCode>(context);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: _buildLayout(context, code)
      ),
    );
  }

  Widget _buildLayout(BuildContext context, VLoginCode code) {
    return Center(
        child: Container(
          width: 400,
          alignment: AlignmentDirectional.center,
          child: Card(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        //leading: Icon(Icons.person),
                        title: Text('CARRINHO VIRTUAL'),
                        subtitle: Text('Digite suas credenciais abaixo'),
                      ),
                      TextFormField(
                          controller: code.txtEmailController,
                          onChanged: (txt) => code.setEmail(txt),
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            errorText: code.invalidEmail ? 'Invalid email' : null,
                            //hintText: 'Login',
                            labelText: 'Email *',
                          )),
                      TextFormField(
                          controller: code.txtPasswordController,
                          obscureText: true,
                          onChanged: (txt) => code.setPassword(txt),
                          decoration: InputDecoration(
                            icon: const Icon(Icons.security),
                            errorText: code.invalidPassword ? 'Invalid password' : null,
                            //hintText: 'Login',
                            labelText: 'Senha *',
                          )),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(child: Text('LOGIN', style: TextStyle(color: Colors.white),), onPressed: () => code.btnLoginClicked(context), color: ThemeDefault.colorSaberLab,),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text('versão ' + Defines.AppVersion, style: TextStyle(color: Colors.grey[900], fontSize: 10),),
                      )
                    ]
                ),
              )
          ),
        )
    );
  }

}
