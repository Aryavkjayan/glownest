import 'package:flutter/material.dart';
import 'package:sale_app/screens/login.dart';
import 'package:sale_app/screens/product_list.dart';
import 'package:form_field_validator/form_field_validator.dart'; 

class loginScreen extends StatefulWidget {
  const loginScreen({
    super.key
  });

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: 700,
        height: 950,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:150.0,bottom: 0),
                child: Text(
                  "GlowNest",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:80.0,bottom: 50),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    errorStyle: TextStyle(fontSize: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(0, 60, 60, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorStyle: TextStyle(fontSize: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(0, 60, 60, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: 130,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(248, 248, 247, 1),
                  ),
                  child: Center(
                    child: InkWell(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 206, 135, 178),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, proceed with navigation
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Products()),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:100.0,right: 150),
                child: Text(
                  "Don't have an Account ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:0.0,left: 250),
                child: TextButton(
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: content,
    );
  }
}