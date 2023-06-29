import 'package:flutter/material.dart';

class DataPegawai extends StatefulWidget {
  const DataPegawai({super.key});

  @override
  State<DataPegawai> createState() => _DataPegawaiState();
}

class _DataPegawaiState extends State<DataPegawai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Data Pegawai',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(25.0),
          ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                'Admin Keren', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '1111111111',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Admin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
          ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                'Dekan Keren', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '1111111112',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Dekan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
          ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                'Wakil Dekan Keren', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '1111111113',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Wakil Dekan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
          ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                'Kepala Bagian Tata Usaha Keren', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '1111111114',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Kepala Bagian Tata Usaha',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
          ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                'Subkoordinator Keren', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '1111111115',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Subkoordinator',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
          ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                'Staff Keren', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '1111111116',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Staff',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}