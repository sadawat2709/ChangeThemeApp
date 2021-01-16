import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class UserImage extends StatefulWidget {
  UserImage(this.imagePickFn);
 final void Function(File pickedimage) imagePickFn;
  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
    File _pickedImage;
    
  void _pickImage() async
  {
  // ignore: deprecated_member_use
  final pickedImageFile=await ImagePicker.pickImage(
    maxWidth: 150,
    imageQuality: 50,
    source: ImageSource.camera);
  setState(() {
    _pickedImage=pickedImageFile;
  });
widget.imagePickFn(pickedImageFile);
  }
  void _pickImageby() async
  {
  // ignore: deprecated_member_use
  final pickedImageFile=await ImagePicker.pickImage(
    maxWidth: 150,
    imageQuality: 50,
    source: ImageSource.gallery);
  setState(() {
    _pickedImage=pickedImageFile;
  });
//widget.imagePickFn(pickedImageFile);
  }
  
  pickImageDialog()
  {
    return showDialog(context: context,child:AlertDialog(
                      backgroundColor: Colors.pinkAccent[200],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      content:Container(
                      //  color: Colors.limeAccent,
                         height: 150,
                         width: 100,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        RaisedButton(
                        onPressed: _pickImageby, child: Text("Gallery")),
                        RaisedButton(onPressed: _pickImage, child: Text("Camera")),
                         RaisedButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel")),
                        

                      ],))
                  
                    )
                    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(children:<Widget>[
 CircleAvatar(
                    radius: 60,
                    backgroundImage:_pickedImage!=null? FileImage(_pickedImage):null
                  ),
                  //SizedBox(height:5),
                  FlatButton.icon(onPressed: ()
                  {
                    return pickImageDialog();
        
                  }, icon: Icon(Icons.image), label: Text("ADD PHOTO"))
    ]);
  }
}
 