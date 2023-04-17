import 'package:flutter/material.dart';
import 'package:lesson/utils/theme.dart';

class Home extends StatefulWidget {
  static const routeName = "/Home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorBackground,
        toolbarHeight: 66,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
        ),
        flexibleSpace: Container(
          height: 66,
          margin: const EdgeInsets.only(top: 28),
          padding: const EdgeInsets.only(right: 16, left: 16),
          decoration:  const BoxDecoration(
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Text("Монгол бичиг", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){},
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Text("hkasdfhsf"),
          ),
        ),
      ),
    );
  }
}
