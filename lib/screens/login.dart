import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sale_app/screens/login1.dart';
import 'package:sale_app/screens/product_list.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key
  });

  @override
  State<SignupScreen> createState() => _SignupScreentate();
}

class _SignupScreentate extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

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
                padding: const EdgeInsets.only(top: 50.0),
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
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  "Sign-up",
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
                  controller: _nameController,
                  validator: RequiredValidator(errorText: 'Please enter your name'),
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
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
                  controller: _addressController,
                  validator: RequiredValidator(errorText: 'Please enter your Address'),
                  decoration: InputDecoration(
                    labelText: 'Enter your Address',
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
                  controller: _phoneController,
                  validator: RequiredValidator(errorText: 'Please enter your Phone number'),
                  decoration: InputDecoration(
                    labelText: 'Enter your Phone number',
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
                  controller: _emailController,
                  validator: RequiredValidator(errorText: 'Please enter your Email'),
                  decoration: InputDecoration(
                    labelText: 'Enter your Email',
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
                  controller: _countryController,
                  validator: RequiredValidator(errorText: 'Please enter your country'),
                  decoration: InputDecoration(
                    labelText: 'Enter your country',
                    errorStyle: TextStyle(fontSize: 16.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(0, 60, 60, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                        'Sign up',
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
                padding: const EdgeInsets.only(top: 20.0, right: 150),
                child: Text(
                  "Already have an Account ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 250),
                child: TextButton(
                  child: Text(
                    'Login',
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
                      MaterialPageRoute(builder: (context) => loginScreen()),
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
