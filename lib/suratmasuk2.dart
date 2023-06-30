// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:DisApp/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuratMasuk2 extends StatefulWidget {
  SuratMasuk2({super.key});

  @override
  State<SuratMasuk2> createState() => _SuratMasuk2State();
}

class _SuratMasuk2State extends State<SuratMasuk2> {

  late final TextEditingController _instansiController; 
  late final TextEditingController _perihalController; 
  late final TextEditingController _tglsuratController; 
  late final TextEditingController _tglsuratditerimaController; 
  late final TextEditingController _klasifikasiController; 
  late final TextEditingController _statusController; 
  late final TextEditingController _lampiranController; 
  late final TextEditingController _sifatController; 
  late final TextEditingController _fotosuratController;

  @override
  void initState() {
    _instansiController = TextEditingController();
    _perihalController = TextEditingController();
    _tglsuratController = TextEditingController();
    _tglsuratditerimaController = TextEditingController();
    _klasifikasiController = TextEditingController();
    _statusController = TextEditingController();
    _lampiranController = TextEditingController();
    _sifatController = TextEditingController();
    _fotosuratController = TextEditingController();
    
    super.initState();
  }

  @override
  void dispose() {
    _instansiController.dispose();
    _perihalController.dispose();
    _tglsuratController.dispose();
    _tglsuratditerimaController.dispose();
    _klasifikasiController.dispose();
    _statusController.dispose();
    _lampiranController.dispose();
    _sifatController.dispose();
    _fotosuratController.dispose();
    super.dispose();
  }

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
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  controller: _instansiController,
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
                  controller: _perihalController,
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
                  controller: _tglsuratController,
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
                  controller: _tglsuratditerimaController,
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
                  controller: _klasifikasiController,
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
                  controller: _statusController,
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
                  controller: _lampiranController,
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
                  controller: _sifatController,
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
                  controller: _fotosuratController,
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
                  onPressed:() {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: [
                            ListView(
                              children: [
                                TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userAccesstoken: null,)));
                                }, 
                                child: Text('Tutup')
                              ),
                              ] 
                            ),
                          ],
                          title: Text('Informasi'),
                          contentPadding: EdgeInsets.all(20.0),
                          content: Text('Data Telah Berhasil Dimasukkan ke Database'),
                        ),
                    );
                    CollectionReference collRef = FirebaseFirestore.instance.collection('database');
                    collRef.add({
                      'Instansi Pengirim'       : _instansiController.text,
                      'Perihal'                 : _perihalController.text,
                      'Tanggal'                 : _tglsuratController.text,
                      'Tanggal Surat Diterima'  : _tglsuratditerimaController.text,
                      'Klasifikasi'             : _klasifikasiController.text,
                      'Status'                  : _statusController.text,
                      'Lampiran'                : _lampiranController.text,
                      'Sifat Pengirim'          : _sifatController.text,
                      'Foto Surat'              : _fotosuratController.text,
                    });
                  },
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