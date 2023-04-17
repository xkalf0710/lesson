
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lesson/ForgotPage.dart';
import 'package:lesson/Home.dart';
import 'package:lesson/apis/user_api.dart';
import 'package:lesson/components/button/primary_button.dart';
import 'package:lesson/components/form/text_field.dart';
import 'package:lesson/model/user.dart';
import 'package:lesson/services/navigator_service.dart';
import 'package:lesson/services/setup.dart';
import 'package:lesson/splashPage.dart';
import 'package:lesson/utils/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool loading = false;

  validation(){
    if(_emailController.text == ""){
      locator<NavigatorService>().alertDialog("Имэйлээ бичнэ үү");
      return false;
    }
  }
  _onSubmit() async{
    if(loading) return;
    if(!validation()) return;
    
    setState(() {
      loading = true;
    });
    try{
      var user = await UserApi().login(User(
        email: _emailController.text,
        password: _passwordController.text,
      ));
      await locator<NavigatorService>().setLocalStorage("authToken",
          user.accessToken!);
      
      Navigator.pushReplacementNamed(context, Home.routeName);
    }catch(err){}
    setState(() {
      loading= false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 72,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  initialValue: const {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Имэйл",
                      style: TextStyle(fontSize: 16,
                      color: colorSecondary,
                      fontWeight: FontWeight.w400,),),
                      SizedBox(height: 11,),
                      FormTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                       validator: (value){},
                      ),
                      SizedBox(height: 15,),
                      const Text("Нууц үг", style: TextStyle(fontSize: 16, color: colorSecondary, fontWeight: FontWeight.w400),),
                      
                      SizedBox(height: 11,),
                      PinCodeTextField(
                        appContext: context, 
                        controller: _passwordController, 
                        keyboardType: TextInputType.number, 
                        obscureText: true,
                        obscuringCharacter: "*",
                        textStyle: const TextStyle(
                          color: colorSecondary, 
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                        length: 4,
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12),
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          selectedColor: colorPrimary,
                          inactiveFillColor: Colors.white,
                          activeColor: Colors.white,
                        ),
                        errorTextSpace: 25,
                        errorTextDirection: TextDirection.ltr,
                        cursorColor: colorSecondary,
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onCompleted: (v) {},
                        onChanged: (value) {},
                        beforeTextPaste: (text){
                          return true;
                        },
                      ),

                      Align(
                        alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: (){
                              Navigator.popAndPushNamed(context, ForgotPage.routeName);
                            },
                            child: Text('Нууц үг сэргээх?', style: TextStyle(fontSize: 13, color: colorSecondary),),
                          ),
                      ),
                      SizedBox(height: 33,),
                      PrimaryButton(
                        onAction: (){
                          _onSubmit();
                        },
                        title: "Нэвтрэх",
                        loading: loading,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
