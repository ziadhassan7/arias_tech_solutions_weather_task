import 'package:flutter/material.dart';

class CustomDialog {
  BuildContext context;
  Widget view;

  bool disablePadding;
  double? borderRadius;
  bool dismissibleDialog;

  Color backgroundColor;
  bool disableTintColor;

  CustomDialog.show(
      this.context, {
        required this.view,
        this.disablePadding = false,
        this.borderRadius,
        this.dismissibleDialog = true,
        this.backgroundColor = Colors.white,
        this.disableTintColor = false,
      }) {
    _materialViewDialog();
  }

  _materialViewDialog() {
    showDialog<String>(
        context: context,
        barrierDismissible: dismissibleDialog,
        builder: (BuildContext context) {
          return PopScope(
            canPop: dismissibleDialog,

            child: Theme(
              data: ThemeData(useMaterial3: true),
              child: AlertDialog(
                surfaceTintColor: disableTintColor ? backgroundColor : null,
                backgroundColor: backgroundColor,

                contentPadding: disablePadding ? EdgeInsets.zero : null,
                shape: (borderRadius != null)
                    ? RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius!)))
                    : null,

                /// Child Content Widget
                content: SingleChildScrollView(child: view),
              ),
            ),
          );
        });
  }
}
