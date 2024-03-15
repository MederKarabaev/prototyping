import 'package:flutter/material.dart';
import 'package:prototyping/models/user_model.dart';

void showDialogDiscover(BuildContext context, UserModel user) {
  showGeneralDialog(
    barrierColor: Colors.black,
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Scaffold(
        backgroundColor: Colors.blue.withOpacity(0.9),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: [
                  const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/auth_circular.png')),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ]),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, widget) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(anim1),
        child: widget,
      );
    },
  );
}
