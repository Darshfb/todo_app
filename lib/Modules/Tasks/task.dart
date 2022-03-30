import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Layout/cubit.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Shared/components/componants.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = TodoCubit.get(context).newTasks;
        return taskBuilder(tasks);
      },
    );
  }
}
