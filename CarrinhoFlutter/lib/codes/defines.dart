
import 'package:carrinhovirtual/themes/theme_default.dart';
import 'package:flutter/material.dart';

class Defines{

  static final String RestBaseURL='http://192.168.1.106:5000/api';
  static String JwtToken='1234';
  static final String AppVersion="1.0.0";
  static final String GoogleAPIKey='change';
  static final currentTheme=new ThemeDefault();
  static  String userID='';
  static String companyID='';
  static final int rowsPerPage=PaginatedDataTable.defaultRowsPerPage;
}