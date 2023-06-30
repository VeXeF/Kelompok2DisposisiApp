// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:DisApp/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http ;

class SuratMasuk3 extends StatefulWidget {
  const SuratMasuk3({super.key});

  @override
  State<SuratMasuk3> createState() => _SuratMasuk3State();
}

class _SuratMasuk3State extends State<SuratMasuk3> {

XFile? image;
List _images = [];
final ImagePicker picker = ImagePicker();
Future sendImage(ImageSource media) async {
	var img = await picker.pickImage(source: media);
	var uri = "http://192.168.1.14/uploadgambar.php";
	var request = http.MultipartRequest('POST', Uri.parse(uri));
	if(img != null){
		var pic = await http.MultipartFile.fromPath("image", img.path);
		request.files.add(pic);
		await request.send().then((result){
			http.Response.fromStream(result).then((response){
				var message = jsonDecode(response.body);
				final snackBar = SnackBar(content: Text(message['message']));
				ScaffoldMessenger.of(context).showSnackBar(snackBar);

				getImageServer();
			});
		}).catchError((e){

	print(e);
		});
	}
}

Future getImageServer() async {
	try{

	final response = await http.get(Uri.parse('http://192.168.1.14/apisuratmasuk.php'));

	if(response.statusCode == 200){
		final data = jsonDecode(response.body);

		setState(() {
		_images = data;
		});
	}
	}catch(e){

	print(e);

	}
}

@override
void initState() {
	super.initState();
	getImageServer();
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
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    sendImage(ImageSource.gallery);
                  },  
                  child: 
                    Text(
                      'Foto Surat',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: 
                      ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
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