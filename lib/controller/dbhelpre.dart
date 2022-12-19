import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper{
  Database?db;

  Future<Database> checkDatabase()async{
    if(db!=null)
    {
      return db!;
    }
    else
    {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase()async{
    Directory  folder = await getApplicationDocumentsDirectory();
    String  path =  join(folder.path,"rnw.db");
    return  openDatabase(path,version:1,onCreate:(db,version){
      String query = "CREATE TABLE Quotes(id INTEGER PRIMARY KEY AUTOINCREMENT,Quote TEXT)";
      db.execute(query);
    });
  }

  void insertData(String n1)async{
    db =  await checkDatabase();
    db!.insert("Quotes", {"Quote":n1,});
  }

  Future<List<Map>> readData()async{
    db= await checkDatabase();
    String query = "SELECT * FROM Quotes";
    List<Map> CilentList = await db!.rawQuery(query,null);
    return CilentList;
  }

  // void deletedata(String id)async{
  //   db= await checkDatabase();
  //   db!.delete("Quotes",where: "id = ?",whereArgs: [int.parse(id)]);
  // }
  //
  // void updatedata(String id,String n1, String m1,String a1)async{
  //   db= await checkDatabase();
  //   db!.update("cilent", {"name":n1,"mobile":m1,"address":a1},where:"id = ?",whereArgs: [int.parse(id)]);
  // }


  // Future<List<Map>> ProreadData({String? id})async{
  //   db= await checkDatabase();
  //   String query = "";
  //   if(id!=null)
  //   {
  //     query = "SELECT * FROM product where client_id = $id";
  //   }
  //   else
  //   {
  //     query = "SELECT * FROM product";
  //   }
  //   List<Map> ProductList = await db!.rawQuery(query,null);
  //   return ProductList;
  // }
  //
  // Future<List<Map>> ProductFilterreaddata(String? date) async {
  //   db = await checkDatabase();
  //   String query = "SELECT * FROM product where date = ?";
  //   List<Map> ProductList = await db!.rawQuery(query, [date]);
  //
  //   return ProductList;
  // }
  //
  // void ProinsertData(String n1,String q1 ,String p1,String pq,int clientId,int status)async{
  //   db =  await checkDatabase();
  //   db!.insert("product", {"product_name":n1,"quantity":q1,"price":p1,"purchase_date":pq,"client_id":clientId,"payment_status":status});
  // }
  //
  // void Prodeletedata(String id)async{
  //   db= await checkDatabase();
  //   db!.delete("product",where: "id = ?",whereArgs: [int.parse(id)]);
  // }

  // void Proupdatedata(String id,String n1, String q1,String p1,String pq,int clientId,int status)async{
  //   db= await checkDatabase();
  //   db!.update("product", {"product_name":n1,"quantity":q1,"price":p1,"purchase_date":pq,"client_id":clientId,"payment_status":status},where:"id = ?",whereArgs: [int.parse(id)]);
  // }
}