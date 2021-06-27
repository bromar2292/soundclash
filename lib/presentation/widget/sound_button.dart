import 'package:flutter/material.dart';

ElevatedButton SoundButton(
    {BuildContext context, Function function, String text}) {
  return ElevatedButton(
    onPressed: function,
    child: Text(text),
  );
}
