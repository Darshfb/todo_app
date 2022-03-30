import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Shared/styles/icon_broken.dart';

class db extends StatefulWidget {
  @override
  _dbState createState() => _dbState();
}

class _dbState extends State<db> {
  @override
  void initState() {
    CreateDatabase();
    super.initState();
  }

  late Database database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          InsertToDatabase();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: IconButton(onPressed: (){}, icon: Icon(IconBroken.Add_User)),
      ),
    );
  }

  void CreateDatabase() async {
     database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('DataBase is Created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error when Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('DataBase is Opened');
      },
    );
  }


   InsertToDatabase() async{
    await database.transaction((txn) async{
       txn.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES("first task","0222","new", "22")').then((value)
      {
        print('$value inserted Successfully');
      }).catchError(
        (error) {
          print('Error when inserting new record ${error.toString()}');
        },
      );
    });
  }

  InsertToDatabase1({
     String title = 'ahmed',
     String time = 'ahmed',
     String date = 'ahmed',
  })async{
    await database.transaction((txn)async{
      txn.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES("first task","0222","222","new",)').then((value)
      {
        print('$value inserted successfully');
      }).catchError((error){
        print('Error when inserting new record ${error.toString()}');
      });

    }

    );

  }
}
