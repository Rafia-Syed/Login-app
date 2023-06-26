import 'package:flutter/material.dart';
import 'package:login_app/login_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen(
      {super.key, 
      required this.username});
   String username;   

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xff395BA9),
        padding: EdgeInsets.all(7.0),
        child: Column(
          
          children: [
            
            SizedBox(height: 40,),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Expanded(child: Text("Login App", style: TextStyle(fontSize: 22, color: Colors.white),)),
                
                const SizedBox(width: 80),
                
                Expanded(
                  child: ElevatedButton.icon(onPressed: () {}, 
                  icon: IconButton(onPressed: () {}, 
                  icon: const Icon(Icons.exit_to_app_outlined)), 
                  label: LoginScreen()),
                )
              ],
            ),
            Spacer(),
            Center(child: Text("Welcome",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
            Center(child: Text(this.username, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
           Spacer(),
          ],
        ),
      ),
    );
  }
}
