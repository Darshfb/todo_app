import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Layout/cubit.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Shared/components/componants.dart';

class ArchiveTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = TodoCubit.get(context).archiveTasks;
        return taskBuilder(tasks);;
      },
    );
  }
}
