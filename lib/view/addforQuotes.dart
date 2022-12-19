import 'package:database/controller/quotes_Conteoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dbhelpre.dart';

class AddQuotes_Screen extends StatefulWidget {
  const AddQuotes_Screen({Key? key}) : super(key: key);

  @override
  State<AddQuotes_Screen> createState() => _AddQuotes_ScreenState();
}

class _AddQuotes_ScreenState extends State<AddQuotes_Screen> {

  Qustes_Controller qustes_controller = Get.put(Qustes_Controller());

  TextEditingController utxtquotes = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    DbHelper db = DbHelper();
    qustes_controller.QuotesList.value = await db.readData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade700,
            leading: IconButton(onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_back)),
            title: Text("Add Qusotes"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: utxtquotes,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.note_alt_sharp),
                      label: Text("Qusotes"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    Get.back();
                  },
                    child: Text("Cancel"),
                    style: ElevatedButton.styleFrom(primary: Colors.red),),

                  ElevatedButton(onPressed: () {
                    DbHelper DB = DbHelper();
                    DB.insertData(utxtquotes.text);
                    getData();
                    Get.back();
                  },
                    child: Text("ADD"),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
