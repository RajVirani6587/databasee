import 'package:get/get.dart';

import '../model/datamodelclass.dart';

class Qustes_Controller extends GetxController{

  RxList<Map>QuotesList = <Map>[].obs;
  Data_Model?Datapick;

  int i=0;
  void changsposition(dynamic index){
    i=index;
    update();
  }


}