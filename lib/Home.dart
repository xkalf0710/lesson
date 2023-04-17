import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = "/Home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 245, 248, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Монгол бичиг", style: TextStyle(
          fontFamily: "Ubuntu",
          fontSize: 21,
          fontWeight: FontWeight.w600,color: Colors.black
        ),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded, color: Colors.blue,
          ),
        ),
        elevation: 0.0,

      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: '',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.black
                  )
                ),
              ),
            ),
            SizedBox(height: 11,),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              onSurface: Colors.white,
              elevation: 0.0,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              primary: Colors.white,
              shadowColor: Colors.white
            ),
            onPressed: (){
              //horwvvleh
            },
             child: Text('Хөрвүүлэх', style: TextStyle(
               fontWeight: FontWeight.w600,
               fontFamily: "Ubuntu",
               fontSize: 15,
               fontStyle: FontStyle.normal,
               color: Colors.black
             ),),
            ),
          ],
        ),
      ),
    );
  }
}
