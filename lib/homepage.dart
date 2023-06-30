// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:DisApp/datapegawai.dart';
import 'package:DisApp/disposisi.dart';
import 'package:DisApp/suratmasuk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required userAccesstoken});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            'Selamat Datang',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.grey[100],
          child: Column(
            children: <Widget> [
              Expanded(
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center),
                            Padding(
                              padding: EdgeInsets.all(16.0)),
                            IconButton(
                              icon: Icon(CupertinoIcons.add_circled, size: 70,),
                              onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SuratMasuk())) 
                            ),                          
                            Text(
                              'Surat Masuk', 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                            Align(
                              alignment: Alignment.center),
                            Padding(
                              padding: EdgeInsets.all(16.0)),
                            IconButton(
                              icon: Icon(CupertinoIcons.doc_person, size: 70,),
                              onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => DataPegawai())) 
                            ),                          
                            Text(
                              'Data Pegawai', 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                            Align(
                              alignment: Alignment.center),
                            Padding(
                              padding: EdgeInsets.all(16.0)),
                            IconButton(
                              icon: Icon(CupertinoIcons.envelope, size: 70,),
                              onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Disposisi())) 
                            ),                          
                            Text(
                              'Disposisi', 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}