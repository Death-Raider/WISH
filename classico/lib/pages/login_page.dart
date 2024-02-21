import 'package:classico/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name="";
  bool changeButton=false;


  final _formKey = GlobalKey<FormState>();

  // Creating method
  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton=true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Image.asset("assets/images/wish-logo.png",
                fit: BoxFit.cover,
              ),

              Text("Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      // for password to not visible
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length<6){
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeButton?20:8),
                      child: InkWell(
                        // splashColor: Colors.red,

                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton?50:150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton?Icon(Icons.done,color: Colors.white,):Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                            // shape: changeButton? BoxShape.circle:BoxShape.rectangle,
                          // ),
                        ),
                      ),
                    ),
                  ],)
              )
            ],
          ),
        ),
      )

    );
  }
}


// ElevatedButton(
//   onPressed: (){
//     // print("Hi Shlok");
//     Navigator.pushNamed(context, MyRoutes.homeRoute);
//   },
//
//   child: Text("Login"),
//   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
//
// ),


// Center(
// child: Text(
// "This is Login Page",
// style: TextStyle(
// fontSize: 40,
// color: Colors.blue,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),