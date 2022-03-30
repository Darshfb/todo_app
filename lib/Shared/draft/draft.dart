import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Layout/cubit.dart';
import 'package:todo_app/Shared/db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
      ],
      child: MaterialApp(
        title: 'TODO ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: db(),
      ),
    );
  }
}
