// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:DisApp/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuratMasuk extends StatefulWidget {
  const SuratMasuk({super.key});

  @override
  State<SuratMasuk> createState() => _SuratMasukState();
}

class _SuratMasukState extends State<SuratMasuk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Surat Masuk',
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
                    hintText: 'Masukkan Instansi Pengirim',
                    labelText: 'Instansi Pengirim',
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
                    hintText: 'Masukkan Perihal',
                    labelText: 'Perihal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Tanggal Surat (Contoh : 1 Januari 2023)',
                    labelText: 'Tanggal Surat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Tanggal Surat Diterima (Contoh : 1 Januari 2023)',
                    labelText: 'Tanggal Surat Diterima',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Klasifikasi',
                    labelText: 'Klasifikasi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Status',
                    labelText: 'Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Lampiran',
                    labelText: 'Lampiran',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Sifat',
                    labelText: 'Sifat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Foto Surat',
                    labelText: 'Foto Surat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
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