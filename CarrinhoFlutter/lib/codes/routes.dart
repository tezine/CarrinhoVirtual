import 'package:carrinhovirtual/views/vcart.code.dart';
import 'package:carrinhovirtual/views/vcart.dart';
import 'package:carrinhovirtual/views/vcart_cards.code.dart';
import 'package:carrinhovirtual/views/vcart_cards.dart';
import 'package:carrinhovirtual/views/vcompanies.code.dart';
import 'package:carrinhovirtual/views/vcompanies.dart';
import 'package:carrinhovirtual/views/vconfig.code.dart';
import 'package:carrinhovirtual/views/vconfig.dart';
import 'package:carrinhovirtual/views/vlogin.code.dart';
import 'package:carrinhovirtual/views/vlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static const root = "/";
  static const login = "/Login";
  static const config = '/Config';
  static const cart = '/Cart';
  static const cartCards = '/CartCards';
  static const test = '/Test';
  static const companies = '/Companies';

  static getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return _buildRoute(settings, new VLogin());
      case Routes.config:
        return _buildRoute(settings, new VConfig());
      case Routes.cart:
        return _buildRoute(settings, new VCart());
      case Routes.cartCards:
        return _buildRoute(settings, new VCartCards());
      case Routes.companies:
        return _buildRoute(settings, new VCompanies());
      default:
        return null;
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }


  static dynamic getProviders() {
    return [
      ChangeNotifierProvider<VLoginCode>(create: (context) => VLoginCode(),),
      ChangeNotifierProvider<VConfigCode>(create: (context) => VConfigCode(),),
      ChangeNotifierProvider<VCartCode>(create: (context) => VCartCode(),),
      ChangeNotifierProvider<VCartCardsCode>(create: (context) => VCartCardsCode(),),
      ChangeNotifierProvider<VCompaniesCode>(create: (context) => VCompaniesCode(),),
    ];
  }
}

