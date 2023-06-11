import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rescue/dbhelper/mongodb.dart';

import '../Dbmodel.dart';
import 'form_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 40,
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 25,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 25,
                            )),
                      ),
                    ],
                  )),
            )
          ],
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: MongoDatabase.getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  print("DATA");

                  print(snapshot.data.toString());
                  print("DATA ENDS HERE");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totalData = snapshot.data.length;
                      return ListView.builder(
                          itemCount: totalData,
                          itemBuilder: (BuildContext context, int index) {
                            MongoDbModel dataHere =
                                MongoDbModel.fromJson(snapshot.data[index]);
                            //if (dataHere.assignedStatus == true) {
                            return displayCard(dataHere);
                            // }
                          });
                    } else {
                      return Center(
                        child: Text("No data"),
                      );
                    }
                  }
                })));
  }

  Widget displayCard(MongoDbModel data) {
    if (data.assignedStatus == true) {
      return Container(
        height: 120,
        child: Card(
            color: Color.fromARGB(255, 35, 36, 37),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  foregroundImage: (data.imageurl != null)
                      ? NetworkImage(data.imageurl)
                      : null,
                  backgroundColor: Colors.yellow,
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${data.fname + data.lname}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Ionicons.location,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${data.location}",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${data.description}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => FormScreen(
                                id: data.id.toHexString(),
                                personalid: data.personalid,
                                lname: data.lname,
                                fname: data.fname,
                                location: data.location,
                                imageurl: data.imageurl,
                                description: data.description),
                          ),
                        );
                      },
                      child: Icon(Icons.check),
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        MongoDatabase.unassignProfile(data.id.toHexString());
                        setState(() {});
                      },
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                )
              ],
            )),
      );
    }
    return SizedBox(
      height: 1,
    );
  }
}

// IconButton(
// onPressed: () {
// // print(data.id);
// // print(data.description);
// // print(data.location);
// // print(data.fname);
// // print(data.lname);
// // print(data.personalid);
// // print(data.imageurl);
//
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (contex) => FormScreen(
// id: data.id.toHexString(),
// personalid: data.personalid,
// lname: data.lname,
// fname: data.fname,
// location: data.location,
// imageurl: data.imageurl,
// description: data.description)));
// },
// icon: Icon(
// CupertinoIcons.right_chevron,
// color: Colors.white,
// ),
// ),
//
// ListTile(
// contentPadding: EdgeInsets.all(4),
// leading: CircleAvatar(
// backgroundColor: Colors.yellow,
// radius: 25,
// child: Icon(
// Icons.person,
// color: Colors.black,
// ),
// ),
// title: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// SizedBox(
// width: 4,
// ),
// Text(
// "${data.fname + data.lname}",
// style: TextStyle(fontSize: 20, color: Colors.white),
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: <Widget>[
// Icon(
// Ionicons.location,
// color: Colors.white,
// size: 20,
// ),
// SizedBox(
// width: 2,
// ),
// Text(
// "${data.location}",
// style: TextStyle(fontSize: 17, color: Colors.white),
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// Row(
// children: [
// SizedBox(
// width: 4,
// ),
// Text(
// "${data.description}",
// style: TextStyle(fontSize: 18, color: Colors.white),
// ),
// ],
// ),
// ],
// ),
// trailing: Column(
// children: [
// ElevatedButton(
// style: ElevatedButton.styleFrom(
//
// backgroundColor: Colors.green,
//
// ),
// onPressed: () {},
// child: Icon(Icons.check),
// ),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.red
// ),
// onPressed: () {},
// child: Icon(Icons.close),
// )
// ],
// )),
