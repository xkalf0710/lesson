
import 'package:flutter/material.dart';
import 'package:lesson/Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Нэвтрэх"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Имэйл',
                  hintText: 'Имэйлээ оруулна уу'
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 15, right: 15,top: 15,bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Нууц үг",
                  hintText: 'Нууц үгээ оруулна уу'
                ),
              ),
            ),
           SizedBox(height: 11,),
            Container(

              decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Home()));
              },
              child: Text('Нэвтрэх', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Ubuntu",
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  color: Colors.black
              ),),),
            ),
            SizedBox(height: 30,),
            Text('Шинэ хэрэглэгч? Шинэ аккунт'),
          ],
        ),
      ),
    );
  }
}
