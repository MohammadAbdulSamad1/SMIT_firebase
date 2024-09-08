import 'package:fluttertoast/fluttertoast.dart';

class toast {
  void taostPopUp(message, background, txtColor) {
    Fluttertoast.showToast(
        msg: message.toString(),
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: background,
        textColor: txtColor,
        fontSize: 16.0);
  }
}
