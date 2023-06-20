import 'package:flutter/material.dart';
import 'package:rescue/screen/homescreen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen(
      {Key? key,
      required this.id,
      // required this.personalid,
      required this.lname,
      required this.fname,
      required this.location,
      required this.description,
      required this.imageurl})
      : super(key: key);
  final String id;
//  final String personalid;
  final String fname;
  final String lname;
  final String imageurl;
  final String location;
  final String description;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formkey = GlobalKey<FormState>();
  // final TextEditingController _name = TextEditingController();
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
  Future<bool> _onWillPop() async {
    Navigator.push(context, MaterialPageRoute(builder: (contex) => HomePage()));
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage(widget.imageurl),
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
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // buildTextField(
                        //     'Personal ID : ', "personalid", widget.personalid),
                        buildTextField('First Name : ', "fname", widget.fname),
                        buildTextField('Last Name : ', "lname", widget.lname),
                        // buildTextField('Date', "", info)
                        buildTextField(
                            'Location : ', "location", widget.location),
                        buildTextField('Description : ', "description",
                            widget.description),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
          // bottomNavigationBar: Row(
          //   children: [
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.03,
          //     ),
          //     ElevatedButton(
          //       onPressed: () {},
          //       child: Text('Reject'),
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.red),
          //         //maximumSize: MaterialStateProperty.all(Size(2, 2))
          //       ),
          //     ),
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.5,
          //     ),
          //     ElevatedButton(
          //       onPressed: () {},
          //       child: Text('Accept'),
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.green),
          //       ),
          //     )
          //   ],
          // ),
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
