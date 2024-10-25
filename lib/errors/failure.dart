import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Failure {
  final String errormsg;

  Failure(this.errormsg);
}

class serverFailure extends Failure {
  serverFailure(super.errormsg);
}

class showmsgclass {
  void showmsg({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      fontSize: 16,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}
