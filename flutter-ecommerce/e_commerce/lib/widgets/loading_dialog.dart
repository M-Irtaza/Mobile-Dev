import 'package:flutter/material.dart';

class LoadingDialogWidget extends StatelessWidget {
  final String? message;

  LoadingDialogWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top:14),
            child:  const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
            ),
          ),

          Text(message.toString() + "Please wait..."),
        ],
      ),
    );
  }
}
