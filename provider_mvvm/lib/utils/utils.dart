import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM_LEFT,
      backgroundColor: const Color.fromARGB(255, 225, 255, 0),
      timeInSecForIosWeb: DateTime.april,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  // static void flashBarErrorMessage(String message, BuildContext context) {
  //   showFlushbar(
  //     context: context,
  //     flushbar: Flushbar(
  //       backgroundColor: Colors.red,
  //       borderRadius: BorderRadius.circular(8),
  //       margin: const EdgeInsets.all(8),
  //       padding: const EdgeInsets.all(16),
  //       icon: const Icon(
  //         Icons.error,
  //         size: 28,
  //         color: Colors.white,
  //       ),
  //       duration: const Duration(seconds: 3),
  //       messageText: Text(
  //         message,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontSize: 16,
  //         ),
  //       ),
  //       isDismissible: true,
  //       dismissDirection: FlushbarDismissDirection.HORIZONTAL,
  //       animationDuration: const Duration(milliseconds: 500),
  //       forwardAnimationCurve: Curves.easeInOut,
  //       reverseAnimationCurve: Curves.easeInOut,
  //       boxShadows: const [
  //         BoxShadow(
  //           color: Colors.black45,
  //           offset: Offset(3, 3),
  //           blurRadius: 3,
  //         ),
  //       ],
  //       flushbarStyle: FlushbarStyle.FLOATING,
  //       showProgressIndicator: true,
  //       progressIndicatorBackgroundColor: Colors.red,
  //       progressIndicatorValueColor:
  //           const AlwaysStoppedAnimation<Color>(Colors.white),
  //       mainButton: TextButton(
  //         onPressed: () {
  //           // Handle the action on button press if needed
  //           Navigator.of(context).pop();
  //         },
  //         child: const Text(
  //           'DISMISS',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     )..show(context),
  //   );
  // }

  void snackBarErrorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }
}
