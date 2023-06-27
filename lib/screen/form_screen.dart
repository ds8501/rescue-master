import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rescue/screen/homescreen.dart';
import 'dart:io';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../details.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // final TextEditingController _pid = TextEditingController();
  // final TextEditingController _location = TextEditingController();
  // final TextEditingController _des = TextEditingController();
  // late String name;
  // late String pid;
  // late String location;
  // late String des;
  // late String imageurl;

  // void initState() {
  //   _name.text = name;
  //   _pid.text = pid;
  //   _location.text = location;
  //   _des.text = des;
  //   super.initState();
  // }
  late File _image;
  final imagepicker = ImagePicker();

  Future getImage() async {
    final image = await imagepicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  ImagePicker image = ImagePicker();
  Future getgallary() async {
    final image = await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.push(context, MaterialPageRoute(builder: (contex) => HomePage()));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController firstcontroller =
        TextEditingController(text: data![widget.index].firstName);
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(data![widget.index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    // width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 5),
                      child: Column(
                        children: [
                          // buildTextField(
                          //     'Personal ID : ', "personalid", widget.fname),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'First name'),
                            controller: firstcontroller,
                          ),
                          TextFormField(
                            // initialValue: widget.lname,
                            decoration: InputDecoration(labelText: 'Last name'),
                          ),
                          // buildTextField('Date', "", info)
                          TextFormField(
                            //   initialValue: widget.location,
                            decoration: InputDecoration(labelText: 'Location'),
                          ),
                          TextFormField(
                            //  initialValue: widget.description,
                            decoration: InputDecoration(labelText: 'desc'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                )
              ],
            ),
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            backgroundColor:
                Colors.deepOrangeAccent, //background color of button
            foregroundColor: Colors.white, //font color, icon color in button
            activeBackgroundColor: Colors
                .deepPurpleAccent, //background color when menu is expanded
            activeForegroundColor: Colors.white,
            visible: true,
            closeManually: false,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                child: Icon(Icons.camera_alt),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: 'Click photo',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: getImage,
              ),
              SpeedDialChild(
                child: Icon(Icons.browse_gallery),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: 'pick photo',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: getgallary,
              )
            ],
          ),
        ));
  }

  // Widget display(MongoDbModel data){
  //   return
  // }
  Widget buildTextField(String labelText, String attribute, String info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: TextField(
        onSubmitted: (text) {
          //MongoDatabase.setData(widget.id, attribute, text);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: info,
          hintStyle: TextStyle(),
        ),
      ),
    );
  }
}
