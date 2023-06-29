// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context, 
          builder: (context) {
            return AlertDialog(
              title: Text('Peringatan'),
              content: Text('Apakah Anda Ingin Keluar?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false), 
                  child: Text('Tidak'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true), 
                  child: Text('Ya'),
                ),
              ],
            );
          }
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: _email,
                autocorrect: false,
                enableSuggestions: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0)
              ),
              TextField(
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Masukkan Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0)
              ),
              TextButton(
                onPressed: () async{
                  final email = _email.text;
                  final password = _password.text;
                    try {
                      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, 
                        password: password
                      );
                      showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text('Tutup')
                                ),
                              ],
                              title: Text('Selamat'),
                              contentPadding: EdgeInsets.all(20.0),
                              content: Text('Akun Teregistrasi! Silahkan Kembali ke Laman Login'),
                            ),
                          );
                      print(userCredential);
                    } on FirebaseAuthException catch (e) {
                        print(e.code);
                        if (e.code == 'weak-password') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text('Tutup')
                                ),
                              ],
                              title: Text('Error'),
                              contentPadding: EdgeInsets.all(20.0),
                              content: Text('Password Lemah'),
                            ),
                          );
                          print('WEAK PASSWORD');             
                        } else if (e.code == 'email-already-in-use') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text('Tutup')
                                ),
                              ],
                              title: Text('Error'),
                              contentPadding: EdgeInsets.all(20.0),
                              content: Text('Email Sudah Terpakai'),
                            ),
                          );
                          print('EMAIL ALREADY IN USE. PLEASE USE ANOTHER EMAIL');
                          print(e.code);
                        } else if (e.code == 'invalid-email') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text('Tutup')
                                ),
                              ],
                              title: Text('Error'),
                              contentPadding: EdgeInsets.all(20.0),
                              content: Text('Format Email Invalid'),
                            ),
                          );
                          print('EMAIL INVALID');
                        }
                      } catch (e) {
                        print('Not Found');
                        print(e.runtimeType);
                        print(e);
                      }    
                },
                child: 
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 15),
                  ),
                style:
                  ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ), 
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Sudah Punya Akun? Silahkan Menuju Laman Login!'),
              )
            ],
          ),
        ),
      ),
    );
  }  
}