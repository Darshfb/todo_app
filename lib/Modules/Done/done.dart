import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Shared/components/componants.dart';
import '../../Layout/cubit.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var tasks = TodoCubit.get(context).doneTasks;
        return taskBuilder(tasks);
      },
    );
  }
}
