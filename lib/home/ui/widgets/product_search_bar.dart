import 'package:flutter/material.dart';

TextField ProductSearchBar() {
  return TextField(
    textInputAction: TextInputAction.search,
    onSubmitted: (String ? value){
      //TODO: search  product search
    },

    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      fillColor: Colors.grey.shade200,
      filled: true,
      hintText: 'Search',
      border:  OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide.none,
      ),

    ),
  );
}