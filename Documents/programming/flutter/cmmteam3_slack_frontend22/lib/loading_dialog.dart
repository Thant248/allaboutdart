import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return   WillPopScope(child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
          
        ),
        child: const  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 32), 
            child: CircularProgressIndicator(),),
          ],
        ),
      ), onWillPop: () async => false);
    },
  );
}
