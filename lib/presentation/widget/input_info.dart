import 'package:flutter/material.dart';

Padding InputInfo({
  String? request,
  required TextEditingController controller,
  Function(String)? function,
  Icon? icon,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 28.0,
      vertical: 15,
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            controller.clear();
          },
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: icon,
        ),
        border:const UnderlineInputBorder(),
        labelText: request,
      ),
      onChanged: function,
    ),
  );
}