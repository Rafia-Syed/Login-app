import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:username_validator/username_validator.dart';
import 'package:login_app/login_screen.dart';

class RegisterScreen extends StatelessWidget {
    RegisterScreen({super.key,});
  
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Size size = MediaQuery.of(context).size;

    TextEditingController usernameCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xffDAE2FF),
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Spacer(),
              const Text(
                'Register',
                style: TextStyle(
                    fontSize: 43,
                    color: Color(0xff646875),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 12),
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 30),
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
              const SizedBox(height: 16),
              TextFormField(
                controller: emailCtrl,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required*'),
                  EmailValidator(errorText: "Enter a valid email*")
                ]),
                decoration: InputDecoration(
                    hintText:'Email',
                    prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passCtrl,
                obscureText: _obscureText,
                validator: LengthRangeValidator(
                    min: 8, max: 20, errorText: "Password length must be 8-20"),
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(){
                        _obscureText = !_obscureText;
                      }
                    },
                    child: Icon(_obscureText ? Icons.visibility
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
              const SizedBox(height: 16),
              TextFormField(
                controller: passCtrl,
                obscureText: _obscureText,
                validator: LengthRangeValidator(
                    min: 8, max: 20, errorText: "Password length must be 8-20"),
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(){
                        _obscureText = !_obscureText;
                      }
                    },
                    child: Icon(_obscureText ? Icons.visibility
                          : Icons.visibility_off)),
                  
                  hintText: "Confirm Password",
                  prefixIcon: Icon(
                    Icons.password_outlined,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  height: 52,
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
                                  builder: (context) => LoginScreen(
                                      
                                      )));
                        }
                      },
                      child: const Text(
                        'Register',
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
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff395BA9),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
