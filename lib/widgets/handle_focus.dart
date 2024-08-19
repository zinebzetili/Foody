import 'package:flutter/material.dart';

class HandleFocus {
  late List<FocusNode> focusNodes;

  HandleFocus(int numFields) {
    focusNodes = List.generate(numFields, (index) => FocusNode());
  }

  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
  }

  void moveFocus(bool forward) {
    for (var i = 0; i < focusNodes.length - 1; i++) {
      if (focusNodes[i].hasFocus) {
        focusNodes[i].unfocus();
        if (forward) {
          focusNodes[i + 1].requestFocus();
        } else {
          if (i > 0) {
            focusNodes[i - 1].requestFocus();
          }
        }
        return;
      }
    }

    if (focusNodes[focusNodes.length - 1].hasFocus && !forward) {
      focusNodes[focusNodes.length - 1].unfocus();
      focusNodes[focusNodes.length - 2].requestFocus();
    }
  }
}
