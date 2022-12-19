import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:get/get.dart';

import '../model/datamodelclass.dart';

class Qustes_Controller extends GetxController{

  RxList<Map>QuotesList = <Map>[].obs;
  Data_Model?Datapick;

  CountdownController ? countdownController= CountdownController(autoStart:false) ;
}