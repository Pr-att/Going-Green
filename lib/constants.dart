import 'package:flutter/material.dart';

showProgress(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}
