import 'package:flutter/material.dart';
import 'package:userproject/helpers/ApiHandler.dart';
import 'package:userproject/helpers/error_handler.dart';
import 'package:userproject/models/Users.dart';
import 'package:userproject/other/NoIntenetConnection.dart';
import 'package:userproject/resources/UrlResources.dart';

class UserProvider with ChangeNotifier
{
  List<Users> alldata;
  ViewUser(context) async
  {

     {
      try {
        await ApiHandler.get(UrlResources.USER_VIEW).then((json){
          alldata = json["data"].map<Users>((obj)=> Users.fromJson(obj)).toList();
          notifyListeners();
        });
      }
      on ErrorHandler catch (e) {
        if (e.message == "Internet Connection Failure") {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NoIntenetConnection())
          );
        }
      }
    }
  }
}