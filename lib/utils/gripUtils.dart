

import 'dart:ui';

import 'package:intl/intl.dart';


class GripUtils{

  Color parseColor(String color) {
    String hex = color.replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex =
      '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }

  String dateOneFormat2Another(String inputDateSTR,String oldFormat,String newFormat) {
    if(inputDateSTR.isEmpty){
      return "";
    }
    var inputFormat = DateFormat(oldFormat);
    var inputDate = inputFormat.parse(inputDateSTR);

    var outputFormat = DateFormat(newFormat);
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }
    String currencyFormatter(String value,bool currencyRequired) {
    if(value == null || value.isEmpty || double.parse(value) == null ){
      return "0.000";
    }
    String currency = "";
    if(currencyRequired){
      currency = "BHD ";
    }
   String amount =  NumberFormat.simpleCurrency(name: currency, decimalDigits: 3).format(double.parse(value));
    return amount;
  }



}