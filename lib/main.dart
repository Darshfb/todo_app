import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Layout/cubit.dart';
import 'package:todo_app/Layout/home_layout.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/Layout/states.dart';
import 'package:todo_app/Shared/Local/cache_helper.dart';
import 'package:todo_app/Shared/components/constant.dart';
import 'package:todo_app/Shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  isDark = CacheHelper.getData(key: 'isDark');
  print('${CacheHelper.getData(key: 'User')}');
  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
    path: 'assets/translations',
    // <-- change the path of the translation files
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(isDark),
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TodoCubit()
              ..CreateDatabase()
              ..changeAppMode(fromShared: isDark)),
      ],
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = TodoCubit.get(context);
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'TODO ',
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: AnimatedSplashScreen(
              //to cover the photo the phone
              splashIconSize: double.infinity,
              duration: 2000,
              splash: Image.asset(
                'assets/images/todo_app.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              nextScreen: HomeLayout(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.transparent,
            ),
          );
        },
      ),
    );
  }
}
