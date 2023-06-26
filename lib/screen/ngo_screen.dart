import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ngo_page extends StatefulWidget {
  const ngo_page({super.key});

  @override
  State<ngo_page> createState() => _ngo_pageState();
}

class _ngo_pageState extends State<ngo_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sevalaya NGO ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "12, F-2, First Floor, Pushkarani Apartments, Ananda Rd",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                  // backgroundImage: AssetImage("user.png"),
                  )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Card(
                    elevation: 5,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bed,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Number of beds available :')
                        ],
                      ),
                    ),

                    // child:
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
