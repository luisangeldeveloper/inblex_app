import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';

showAlertMessage( BuildContext context, String titulo, String subtitutlo ) {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.grey[600]));

  if ( Platform.isAndroid ) {
    return showDialog(
      context: context,
      builder: ( _ ) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitutlo),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        actions: [
          MaterialButton(
            child: Text('Ok'),
            elevation: 5,
            textColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      )
    );
  }

  showCupertinoDialog(
    context: context, 
    builder: ( _ ) => CupertinoAlertDialog(
      title: Text(titulo),
      content: Text(subtitutlo),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    )
  );

}

showAlertMessageDelete( BuildContext context, String titulo, String subtitutlo, Function onTap, Function onTapCancel ) {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.grey[600]));

  if ( Platform.isAndroid ) {
    return showDialog(
      context: context,
      builder: ( _ ) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitutlo),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        actions: [
          MaterialButton(
            child: Text('Cancelar'),
            elevation: 5,
            textColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: onTapCancel,
          ),
          MaterialButton(
            child: Text('Aceptar'),
            elevation: 5,
            textColor: Colors.green[600],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: onTap,
          ),
        ],
      )
    );
  }

  showCupertinoDialog(
    context: context, 
    builder: ( _ ) => CupertinoAlertDialog(
      title: Text(titulo),
      content: Text(subtitutlo),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    )
  );

}