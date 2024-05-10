// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  BuildContext c;
  Flushbar? flush;
  FlushbarPosition? flushbarPosition;
  FlushBarHelper({
    required this.c,
    this.flush,
    this.flushbarPosition,
  });

  showFlushBar(
    String message,
    FlushBarType flushBarType,
  ) {
    flush = Flushbar(
      message: message,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      borderColor: flushBarType == FlushBarType.success
          ? const Color.fromARGB(255, 114, 222, 191)
          : const Color.fromARGB(255, 204, 65, 65),
      messageColor: Colors.black,
      flushbarPosition: flushbarPosition ?? FlushbarPosition.BOTTOM,
      backgroundColor:Theme.of(c).colorScheme.background,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      margin: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(12),
      isDismissible: true,
      icon: flushBarType == FlushBarType.success
          ? const SizedBox(
              width: 24,
              height: 24,
              child: Icon(Icons.done_outline_rounded),
            )
          : const SizedBox(
              width: 24,
              height: 24,
              child: Icon(Icons.cancel),
            ),
      duration: const Duration(seconds: 4),
      mainButton: IconButton(
          onPressed: () {
            flush?.dismiss(true);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
            size: 18,
          )),
    )..show(c);
  }
}

enum FlushBarType { error, success }
