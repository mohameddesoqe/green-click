

import 'package:flutter/material.dart';
import 'package:untitled2/features/home-feature/screens/Login.dart';
import 'package:untitled2/features/home-feature/screens/signup.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Text("Make sure your food \nis healthy only here",  style: TextStyle(color:Color.fromRGBO(255, 255, 255, 2),fontSize: 20),)
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));}},
              child: Container(
                
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1B5E20), // set to a dark green color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SignUpScreen();
                        }));}},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1B5E20), // set to a dark green color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}