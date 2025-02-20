import 'package:flutter/material.dart';

import '../home.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<StatefulWidget> createState() =>_LogInState();

}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body:Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 250,),
          Text('Welome Back',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30,color: Colors.black45),),
          SizedBox(height: 10,),
          TextFormField(
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500),
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            )
          ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500),
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14),
                )
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 2.0,
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 56),
            ), child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }, child: Text("SignUp"))
            ],
          ),
        ],
      ),
      ),
    );
  }

}

class SignUp extends StatefulWidget{
  const SignUp({super.key});
  

  @override
  State<StatefulWidget> createState() => _SignUpState();
  
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 250,),
            Text('Register',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30,color: Colors.black45),),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2.0,
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 56),
              ), child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account"),
                TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                }, child: Text("LogIn"))
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}