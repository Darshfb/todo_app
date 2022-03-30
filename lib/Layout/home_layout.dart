import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Layout/cubit.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Shared/Widgets/custom_text_form_field.dart';
import 'package:todo_app/Shared/styles/icon_broken.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state)
      {
        if(state is SuccessInsertDBState)
        {
          Navigator.pop(context);
          titleController.clear();
          timeController.clear();
          dateController.clear();
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('${cubit.Titles[cubit.index]}'.tr(),),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheet) {
                if (formKey.currentState!.validate()) {
                  cubit.InsertToDatabase(
                    title: titleController.text,
                    time: timeController.text,
                    date: dateController.text,
                  );
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: defaultTextFormField(
                                  controller: titleController,
                                  textInputType: TextInputType.text,
                                  prefixIcon: Icons.edit,
                                  labelText: 'Title'.tr(),
                                  isDense: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Title mustn\'t be empty'.tr();
                                    } else
                                      return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: defaultTextFormField(
                                  controller: timeController,
                                  textInputType: TextInputType.datetime,
                                  prefixIcon: Icons.watch_later_outlined,
                                  labelText: 'Time'.tr(),
                                  isDense: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Time mustn\'t be empty'.tr();
                                    } else
                                      return null;
                                  },
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timeController.text =
                                          value!.format(context);
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: defaultTextFormField(
                                  controller: dateController,
                                  textInputType: TextInputType.datetime,
                                  prefixIcon: Icons.calendar_today,
                                  labelText: 'Date'.tr(),
                                  isDense: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date mustn\'t be empty'.tr();
                                    } else
                                      return null;
                                  },
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2200-12-12'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).closed
                    .then((value) {
                  cubit.changeButtonIcon();
                },
                );
                cubit.changeButtonIcon();
              }
            },
            child: Icon((cubit.isBottomSheet) ? Icons.add : Icons.edit),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Bookmark), label: 'Tasks'.tr()),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Shield_Done), label: 'Done'.tr()),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Folder), label: 'Archive'.tr()),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'Settings'.tr()),
            ],
            onTap: (value) {
              cubit.BottomBar(value);
            },
            elevation: 0,
            currentIndex: cubit.index,
            fixedColor: Colors.deepOrange,
            type: BottomNavigationBarType.fixed,
          ),
          body: WillPopScope(
            child: ConditionalBuilder(
              condition: state is! LoadingGetDBState,
              fallback: (BuildContext context) => Center(
                child: CircularProgressIndicator(),
              ),
              builder: (BuildContext context) => cubit.Screens[cubit.index],
            ),
            onWillPop: () {
              return cubit.onWillPop(context);
            },
          ),
        );
      },
    );
  }
}
