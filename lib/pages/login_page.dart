import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeval = false;
  final form_key = GlobalKey<FormState>();
  moveToHome(BuildContext context)async{
    if(form_key.currentState!.validate()) {
      setState(() {
        changeval = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeval = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: form_key,
            child: Column(children: [
              Image.asset("assets/images/login_page.png", fit: BoxFit.cover),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter username", labelText: "Username"),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username Cannot be Empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name =value;
                        setState(() {
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password Cannot be Empty";
                        }
                        else if(value.length < 6){
                          return "Password Length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeval ? 50 :8),
                      child: InkWell(
                        onTap:() => moveToHome(context) ,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeval ? 50:150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeval ?Icon(Icons.done,
                          color: Colors.white,):
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
