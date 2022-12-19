
import 'package:database/view/addforQuotes.dart';
import 'package:database/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>Home_Screen(),
          'add':(context)=>AddQuotes_Screen(),
        },
      )
  );
}


