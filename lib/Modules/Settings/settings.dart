import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Layout/cubit.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Shared/Widgets/custom_button.dart';
import 'package:todo_app/Shared/Widgets/custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  cubit.changeAppMode();
                },
                child: Container(
                  height: 35.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((cubit.isDark) ? 'Dark'.tr() : 'Light'.tr()),
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon((cubit.isDark)
                          ? Icons.brightness_4_rounded
                          : Icons.brightness_4_outlined),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                    bottom: 10.0,
                    top: 10.0,
                  ),
                  child: CustomText(
                    text: 'Choose your Language'.tr(),
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                  backgroundColor: Colors.deepOrange,
                  child: Text(
                    'Arabic'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  minWidth: 130,
                  onPressed: () {
                    cubit.changeLanguageToArabic(context);
                  }),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                  child: Text(
                    'English'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  minWidth: 130,
                  onPressed: () {
                    cubit.changeLanguageToEnglish(context);
                  }),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
