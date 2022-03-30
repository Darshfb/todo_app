import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Layout/cubit.dart';

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 10,
          shadowColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  child: Text(
                    '${model['time']}',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${model['title']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${model['date']}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                IconButton(
                  onPressed: () {
                    TodoCubit.get(context)
                        .updateData(status: 'done', id: model['id']);
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    TodoCubit.get(context)
                        .updateData(status: 'archive', id: model['id']);
                  },
                  icon: Icon(
                    Icons.archive_outlined,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
  onDismissed: (direction)
  {
    TodoCubit.get(context).deleteData(id: model['id']);
  },
    );

Widget taskBuilder(tasks) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (BuildContext context) => ListView.separated(
    reverse: true,
    itemBuilder: (context, index) =>
        buildTaskItem(tasks[index], context),
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
      child: Divider(
        color: Colors.grey[300],
        height: 1.0,
      ),
    ),
    itemCount: tasks.length,
  ),
  fallback: (BuildContext context) => Center(
    child:
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: Text(
                'Not Tasks Yet, please Add some Tasks'.tr(),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ]),
  ),
);
