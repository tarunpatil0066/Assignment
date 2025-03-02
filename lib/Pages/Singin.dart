import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  bool _isObscure = true;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  final _Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _Formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset('Assets/Logo.png'),
                    ),
                    SizedBox(height: screenheight*0.1,),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: screenwidth*0.07,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: screenheight*0.04,),
                    Row(
                      children: [
                        Text(
                          '@',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: screenwidth*0.05,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: screenwidth*0.02,),
                        Expanded(
                          child: TextFormField(
                            controller: EmailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )
                            ),
                            validator: (value){
                              if(value == null||value.isEmpty){
                                return 'Please enter your email';
                              }
                              String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                              RegExp regExp = RegExp(emailPattern);
                              if (!regExp.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenheight*0.01,),
                    Row(
                      children: [
                         Icon(
                            Icons.lock,
                             color: Colors.blueAccent
                          ),
                        SizedBox(width: screenwidth*0.02,),
                        Expanded(
                          child: TextFormField(
                            obscureText: _isObscure,
                            controller: PasswordController,
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffix: IconButton(
                            padding: const EdgeInsets.all(0),
                            iconSize: 20.0,
                            icon: _isObscure
                                ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                                : const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                            ),
                            validator: (value){
                              if(value == null||value.isEmpty){
                                return 'Please enter your password';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenheight*0.03,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: (){
                            if(_Formkey.currentState!.validate()){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context)=>Homepage())
                              );
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenwidth*0.04,
                            ),
                          ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        )
                      ),
                    ),

                    SizedBox(height: screenheight*0.05,),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey,)),
                        SizedBox(width: screenwidth*0.01,),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                        SizedBox(width: screenwidth*0.01,),
                        Expanded(child: Divider(color: Colors.grey,)),
                      ],
                    ),
                    SizedBox(height: screenheight*0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'Assets/googleLogo.png',
                              width: screenwidth*0.08,
                              height: screenheight*0.06,
                            ),
                            SizedBox(width: screenwidth*0.02,),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontSize: screenwidth*0.04,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenheight*0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to Adhicine?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenwidth*0.04,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: screenwidth*0.04,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
