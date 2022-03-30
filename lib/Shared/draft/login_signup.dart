import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todo_app/Shared/draft/palette.dart';


class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = false;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          //Start section image with text
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("imagesassets/images/flutter-apps.png"),
                    fit: BoxFit.fill,
                  )),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20 ,right: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "مرحبا بك",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Almarai",
                            letterSpacing: 2,
                            color: Colors.yellow[700]),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? "  " : "",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Almarai",
                                color: Colors.yellow[700]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      isSignupScreen
                          ? "اشترك للمتابعة"
                          : "تسجيل الدخول للمتابعة",
                      style: TextStyle(letterSpacing: 1, color: Colors.white,fontFamily: "Almarai",),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //End  section image with text

          //Start Login desgin
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(20),
              height: isSignupScreen ? 450 : 260,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Almarai",
                                  color: isSignupScreen
                                      ? Palette.textColor1
                                      : Palette.activeColor,
                                ),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 65,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "التسجيل",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Almarai",
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //Start textField desgin
                    //check if is screen sign up
                    if (isSignupScreen) buildSignUpSection(),
                    //check if is screen does not sign up
                    if (!isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            buildTextField(MaterialCommunityIcons.account_check, "اسم المستخدم", false, false ,TextInputType.text),
                            SizedBox(height: 10,),
                            buildTextField(Icons.mail_outline, "info@gmail.com", false, true  , TextInputType.emailAddress),
                            /* Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isRememberMe,
                                      activeColor: Palette.textColor2,
                                      onChanged: (value) {
                                        setState(() {
                                          isRememberMe = !isRememberMe;
                                        });
                                      },
                                    ),
                                    Text(
                                      "ذكرني",
                                      style: TextStyle(
                                          fontSize: 12,fontFamily: "Almarai",
                                          color: Palette.textColor1),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "نسيت كلمة المرور ؟",
                                    style: TextStyle(
                                        fontSize: 12,fontFamily: "Almarai",
                                        color: Palette.textColor1),
                                  ),
                                ),
                              ],
                            ),*/
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          //Start add button
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 600 : 440,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),

                child: GestureDetector(





                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange.shade200, Colors.red.shade400],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSignUpSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(MaterialCommunityIcons.account_outline, "اسم كامل",
              false, false  , TextInputType.text),
          buildTextField(
              MaterialCommunityIcons.account_check, "اسم المستخدم", false, false  , TextInputType.text),
          buildTextField(
              MaterialCommunityIcons.email_outline, "البريد الالكتروني", false, true , TextInputType.emailAddress),

          buildTextField(
              MaterialCommunityIcons.phone_outline, "رقم الهاتف", false, true , TextInputType.emailAddress),

          buildTextField(
              MaterialCommunityIcons.textbox_password, "كلمة المرور", false, true , TextInputType.emailAddress),

          // Padding(
          //   padding: const EdgeInsets.only(top: 10, left: 10),
          //   child: Row(
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             isMale = true;
          //           });
          //         },
          //         child: Row(
          //           children: [
          //             Container(
          //               width: 30,
          //               height: 30,
          //               margin: EdgeInsets.only(right: 8),
          //               decoration: BoxDecoration(
          //                 color:
          //                     isMale ? Palette.textColor2 : Colors.transparent,
          //                 border: Border.all(
          //                   width: 1,
          //                   color: isMale
          //                       ? Colors.transparent
          //                       : Palette.textColor2,
          //                 ),
          //                 borderRadius: BorderRadius.circular(15),
          //               ),
          //               child: Icon(
          //                 MaterialCommunityIcons.account_outline,
          //                 color: isMale ? Colors.white : Palette.iconColor,
          //               ),
          //             ),
          //             Text(
          //               "Male",
          //               style: TextStyle(color: Palette.textColor1),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         width: 30,
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             isMale = false;
          //           });
          //         },
          //         child: Row(
          //           children: [
          //             Container(
          //               width: 30,
          //               height: 30,
          //               margin: EdgeInsets.only(right: 8),
          //               decoration: BoxDecoration(
          //                 color:
          //                     isMale ? Colors.transparent : Palette.textColor1,
          //                 border: Border.all(
          //                   width: 1,
          //                   color: isMale
          //                       ? Palette.textColor1
          //                       : Colors.transparent,
          //                 ),
          //                 borderRadius: BorderRadius.circular(15),
          //               ),
          //               child: Icon(
          //                 MaterialCommunityIcons.account_outline,
          //                 color: isMale ? Palette.iconColor : Colors.white,
          //               ),
          //             ),
          //             Text(
          //               "Female",
          //               style: TextStyle(color: Palette.textColor1),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }


  Widget buildTextField(IconData icon, String hintText, bool isPassword, bool isEmail   ,TextInputType typeInput ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: TextFormField(

        textAlign: TextAlign.right,
        obscureText: isPassword,
        keyboardType:typeInput,
        // keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title){
    final snackbar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15 ,fontFamily: "Almarai"),),
    );


  }






}






