import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

class uploadImage extends StatefulWidget{
  final User userDb;
  String title;
  uploadImage({Key key, @required this.userDb,this.title}) : super(key: key);
  @override
  _uploadImageState createState() => _uploadImageState(userDb: userDb,title: title);
}

class _uploadImageState extends State<uploadImage> {
  File _image;
String title;
  String _uploadedFileURL;
  final User userDb;
  final picker = ImagePicker();
  _uploadImageState({Key key, @required this.userDb,this.title}) : super();
  Future chooseFile() async {
      /*final pickedFile= await picker.getImage(source: ImageSource.gallery);
    _image =  File(pickedFile.path);*/
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }
  Future uploadFile() async {


    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('$title/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    if('$title'=='Certificate'){    userDb.certUrl = dowurl.toString();
    }
    if('$title'=='Resume'){    userDb.resumeUrl = dowurl.toString();
    }
    if('$title'=='Picture'){    userDb.photoUrl = dowurl.toString();
    }
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        userDb.certUrl=fileURL;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Upload'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            _image != null
                ? Image.asset(
              _image.path,
              height: 150,
            )
                : Container(height: 150),
            _image == null
                ? RaisedButton(
              child: Text('Choose File'),
              onPressed: chooseFile,
              color: Colors.cyan,
            )
                : Container(),
            _image != null
                ? RaisedButton(
              child: Text('Upload File'),
              onPressed: uploadFile,
              color: Colors.cyan,
            )
                /*: Container(),
            _image != null
                ? RaisedButton(
              child: Text('Clear Selection'),
              onPressed: clearSelection,
            )*/
                : Container(),
            Text('Uploaded Image'),
            _uploadedFileURL != null
                ? Image.network(
              _uploadedFileURL,
              height: 150,
            )
                : Container(),
          ],
        ),
      ),
    );
  }}