import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Modules/Done/done.dart';
import 'package:todo_app/Modules/Settings/settings.dart';
import 'package:todo_app/Modules/Tasks/task.dart';
import 'package:todo_app/Modules/Archive/archive.dart';
import 'package:todo_app/Shared/Local/cache_helper.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(InitialTodo());

  static TodoCubit get(context) => BlocProvider.of(context);

  bool isBottomSheet = false;

  void changeButtonIcon() {
    isBottomSheet = !isBottomSheet;
    emit(ChangeButtonSheetState());
  }

  List<String> Titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
    'Settings',
  ];

  Future<bool> onWillPop(context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        title: Text('Are you sure?'.tr()),
        content: Text('Do you want close The app?'.tr()),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

  void LogOut() {
    emit(ClearLoadingDataState());
    CacheHelper.clearData('User').then((value)
    {
      emit(ClearSuccessDataState());
    }).catchError((error)
    {
      emit(ClearErrorDataState());
    });
  }

  void changeLanguageToEnglish(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == Locale('ar', 'EG')) {
      context.locale = Locale('en', 'US');
    }
    emit(ChangeLanguageToEnglishState());
  }

  void changeLanguageToArabic(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == Locale('en', 'US')) {
      context.locale = Locale('ar', 'EG');
    }
    emit(ChangeLanguageToArabicState());
  }

  List<Widget> Screens = [
    NewTasks(),
    DoneTasks(),
    ArchiveTasks(),
    Settings(),
  ];

  int index = 0;

  void BottomBar(value)
  {
    index = value;
    emit(SuccessBottomAppBarState());
  }
//Sometimes, your app needs to save important data on the device. A SQL database engine that is available on almost any device... including mobile phones,
// is called SQLite.  It's small and self-contained. It uses a single file  to store your tables,
  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
// let's first create our database
  void CreateDatabase()
  {
    openDatabase(
      'todo.db', // here the engine will search if there is any file with that name, if no... it will create a database file with that name, if yes it will be opened
      version: 1, // here to create our database
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
      }, //here if there is file that call with the name of the database file, so it will be opened directly
      onOpen: (database) {
        print('DataBase is Opened');
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      print('Hi $value');
      emit(SuccessCreateDBState());
    });
  }

  InsertToDatabase({
    String? title,
    String? date,
    String? time,
    String? status = 'New',
  }) async {
    return await database?.transaction((txn) async {
      txn.rawInsert('INSERT INTO tasks (title, date, time, status) VALUES("$title","$date","$time", "$status")').then((value) {
        emit(SuccessInsertDBState());
        print('$value inserted Successfully');
        getDataFromDatabase(database);
      }).catchError(
        (error) {
          print('Error when inserting new record ${error.toString()}');
        },
      );
    });
  }

  void deleteData({
    required int? id,
  }) async
  {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(SuccessDeleteDBState());
    });
  }

  void getDataFromDatabase(database)
  {
    newTasks = [];
    archiveTasks = [];
    doneTasks = [];
    emit(LoadingGetDBState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'New') {
          newTasks.add(element);
          print(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
          print(element);
        } else {
          print(element);
          archiveTasks.add(element);
        }
      });
      emit(SuccessGetDBState());
    });
  }

  void updateData({
    required String? status,
    required int? id,
  }) async
  {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(SuccessUpdateDBState());
    });
  }


  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value)
      {
        print('zzzzzzzzzzzzz ${isDark.toString()}');
        emit(TodoChangeAppMode());
      });
    }


  }

}
