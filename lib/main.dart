import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_app/cart_provider.dart';
import 'package:sale_app/screens/login1.dart';
// import 'package:sale_app/screens/product_list.dart';
// import 'package:sale_app/db.dart';

void main()  {
  
  runApp(  
    const MyApp()
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => CartProvider(),
    child: Builder(builder:  (BuildContext context){
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(   
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(32, 3, 61,1),
                Color.fromRGBO(0, 60, 60,1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
             ),
          child:  loginScreen(),),
      ),
    );
    }
    ),
    );
  }
}
