import 'package:database/controller/quotes_Conteoller.dart';
import 'package:database/view/addforQuotes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dbhelpre.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {


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
          title: Text("Amazing Quotes"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Quotes History",style: TextStyle(color: Colors.white,fontSize: 25),),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(() =>
                      ListView.builder(
                          itemCount: qustes_controller.QuotesList.value.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: ListTile(
                                  leading: Text("${qustes_controller.QuotesList.value[index]['id']}"),
                                  title: Text(
                                      "${qustes_controller.QuotesList.value[index]['Quote']}"),
                                ),
                              ),
                            );
                          }))),
            ],
          ),
        ),
        body: Obx(() => ListView.builder(
              itemCount: qustes_controller.QuotesList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ListTile(
                      leading: Text("${qustes_controller.QuotesList.value[index]['id']}"),
                      title: Text(
                          "${qustes_controller.QuotesList.value[index]['Quote']}"),
                    ),
                  ),
                );
              },
            )),
        floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            Get.to(AddQuotes_Screen());
          },
        ),
      ),
    );
  }
}
