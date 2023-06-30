// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:DisApp/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Disposisi extends StatefulWidget {
  const Disposisi({super.key});

  @override
  State<Disposisi> createState() => _DisposisiState();
}

class _DisposisiState extends State<Disposisi> {

  String dropdownvalue = 'Dekan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Disposisi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Tanggal Disposisi',
                    labelText: 'Tanggal Disposisi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Catatan',
                    labelText: 'Catatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                DropdownButton <String> (
                  value: dropdownvalue,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15
                    ),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Dekan',
                      child: Text('Dekan'),
                    ),
                    DropdownMenuItem(
                      value: 'Wakil Dekan',
                      child: Text('Wakil Dekan'),
                    ),
                    DropdownMenuItem(
                      value: 'Kepala Bagian Tata Usaha',
                      child: Text('Kepala Bagian Tata Usaha'),
                    ),
                    DropdownMenuItem(
                      value: 'Subkoordinator',
                      child: Text('Subkoordinator'),
                    ),
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),
                  ], 
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextButton(
                  onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userAccesstoken: null,))),
                  child: 
                    Text(
                      'Kirim',
                      style: TextStyle(fontSize: 20),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}