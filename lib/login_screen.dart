import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_app/register_screen.dart';
import 'package:username_validator/username_validator.dart';
import 'package:login_app/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    TextEditingController usernameCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();

    var passToggle;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: const Color(0xffDAE2FF),
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Spacer(),
              const Text(
                'Welcome back',
                style: TextStyle(
                    fontSize: 43,
                    color: Color(0xff646875),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 12),
              const Text(
                'Login to your account',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: usernameCtrl,
                validator: (value) {
                  if (!UValidator.validateThis(
                      pattern: RegPattern.strict, username: value!)) {
                    return 'Invalid username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passCtrl,
                obscureText: _obscureText,
                validator: LengthRangeValidator(
                    min: 8, max: 20, errorText: "Password length must be 8-20"),
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState() {
                          _obscureText = !_obscureText;
                        }
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.password_outlined,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Center(
                child: SizedBox(
                  height: 56,
                  width: size.width * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff395BA9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        if (formKey.currentState!.validate() == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        username: usernameCtrl.text,
                                      )));
                        }

                        print("login succesfully");
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen(
                                    )));
                      }
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff395BA9),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
        
      ),
    );
  }
}
