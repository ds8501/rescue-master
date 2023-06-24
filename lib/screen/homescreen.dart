import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rescue/apiModel.dart';
import '../modelhelper.dart';
import 'form_screen.dart';

bool? theme = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ApiCall>? data;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // print('calling function');
    List<ApiCall>? responseData = await baseclient().get();
    print('hello');
    if (responseData != null) {
      setState(() {
        data = responseData;
        print('HIIIIII');
        isLoaded = true;
      });
    } else {
      print('hiiiiiiii');
    }
  }

  late ThemeMode _thememode = ThemeMode.system;

  void changetheme(theme) {
    if (theme == true)
      setState(() {
        _thememode = ThemeMode.light;
      });
    else
      setState(() {
        _thememode = ThemeMode.dark;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData.dark(),
      themeMode: _thememode,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                if (theme == false)
                  theme = true;
                else if (theme == true) theme = false;

                changetheme(theme);
              },
              icon: Icon(
                Icons.star,
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
          body: Visibility(
            visible: isLoaded,
            // ignore: sort_child_properties_last
            child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (BuildContext context, int index) {
                  Text(data![index].firstName);
                  const Text('hello world');
                  return displayCard(data![index]);
                  //}
                }),
            replacement: const Center(
              child: Text('no data byee byee'),
            ),
          )),
    );
  }

  Widget displayCard(ApiCall data) {
    // if (data.ngoAssigned == true) {
    return Container(
      height: 120,
      child: Card(
          color: Color.fromARGB(255, 35, 36, 37),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              CircleAvatar(
                // ignore: unnecessary_null_comparison
                foregroundImage:
                    // ignore: unnecessary_null_comparison
                    (data.image != null) ? NetworkImage(data.image) : null,
                backgroundColor: Colors.yellow,
                radius: 25,
                child: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${data.firstName + data.lastName}",
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
                        "${data.pickupLocation}",
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
                              id: data.id,
                              // personalid: data.personalid,
                              lname: data.lastName,
                              fname: data.firstName,
                              location: data.pickupLocation,
                              imageurl: data.image,
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
                      // MongoDatabase.unassignProfile(data.id);
                      // setState(() {});
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
    // }
  }
}
