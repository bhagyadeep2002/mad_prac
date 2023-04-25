import 'package:flutter/material.dart';



void main() => runApp(const MyApp());



class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Sign In Form',

      home: const SignInForm(),

    );

  }

}



class SignInForm extends StatefulWidget {

  const SignInForm({Key? key}) : super(key: key);



  @override

  _SignInFormState createState() => _SignInFormState();

}



class _SignInFormState extends State<SignInForm> {

  final _formKey = GlobalKey<FormState>();

  String _email = '';

  String _password = '';



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Sign In'),

      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: Form(

          key: _formKey,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              TextFormField(

                decoration: const InputDecoration(

                  labelText: 'Email',

                  border: OutlineInputBorder(),

                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {

                    return 'Please enter your email';

                  }

                  return null;

                },

                onSaved: (value) {

                  _email = value!;

                },

              ),

              const SizedBox(height: 16),

              TextFormField(

                obscureText: true,

                decoration: const InputDecoration(

                  labelText: 'Password',

                  border: OutlineInputBorder(),

                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {

                    return 'Please enter your password';

                  }

                  else if(value.length < 8){

                    return 'Please enter a password above 8 characters';

                  }

                  return null;

                },

                onSaved: (value) {

                  _password = value!;

                },

              ),

              const SizedBox(height: 16),

              ElevatedButton(

                onPressed: () {

                  if (_formKey.currentState!.validate()) {

                    _formKey.currentState!.save();

                    print('Email: $_email');

                    print('Password: $_password');

                    showDialog(context: context, builder: (ctx){

                      return AlertDialog(

                        title:const Text("Here are your details!"),

                        content: Column(children: [

                          Text('Email: $_email'),

                          Text('Password: $_password')

                        ]

                        ),



                      );

                    }

                    );

                  }

                },

                child: const Text('Sign In'),

              ),

            ],

          ),

        ),

      ),

    );

  }

}