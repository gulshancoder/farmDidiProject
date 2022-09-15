import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Order management'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  XFile? _imageFile;

  _openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  _openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Table(
                defaultColumnWidth: FixedColumnWidth(170),
                // border: null,
                border: null,
                children: [
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bitter Gourd Pickle',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w800),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Order No 1',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.green),
                          )
                        ]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(fontSize: 20.0),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '20kg',
                            style: TextStyle(fontSize: 20.0),
                          )
                        ]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivery Date',
                              style: TextStyle(fontSize: 20.0))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('30 June 2022', style: TextStyle(fontSize: 20.0))
                        ]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print('kuch bhi');
                              },
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('PO'), // <-- Text
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      // <-- Icon
                                      Icons.upload_file,
                                      size: 24.0,
                                    ),
                                  ]))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print('button concept clear');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              ),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 16,
                                      child: IconButton(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 8),
                                        iconSize: 20,
                                        icon: const Icon(
                                          Icons.upload_file,
                                        ),
                                        onPressed: () => {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    title: Text(
                                                        "From where do you want to take the photo?"),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          GestureDetector(
                                                            child:
                                                                Text("Gallery"),
                                                            onTap: () {
                                                              _openGallery();
                                                            },
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          8.0)),
                                                          GestureDetector(
                                                            child:
                                                                Text("Camera"),
                                                            onTap: () {
                                                              _openCamera();
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    ));
                                              })
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1,
                                      width: 7,
                                    ),
                                    Text("Invoice")
                                  ]))
                        ]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('button concept clear');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Text('Accepted'),
                          )
                        ]),
                    Column(
                        children: [Text('', style: TextStyle(fontSize: 20.0))]),
                  ]),
                ]),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Raw material for 10 kg batch',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              'penalty will be charged if below photos are not uploaded',
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: DataTable(
                columnSpacing: 0,
                horizontalMargin: 0,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('name'),
                  ),
                  DataColumn(
                    label: Text('Weight(kg)'),
                  ),
                  DataColumn(
                    label: Text('Brand photo'),
                  ),
                  DataColumn(
                    label: Text('upload'),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('bittergourd'),
                      ),
                      DataCell(
                        Text('12'),
                      ),
                      DataCell(
                        Text('N/A'),
                      ),
                      DataCell(
                        Text('...'),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('lemon'),
                      ),
                      DataCell(
                        Text('5'),
                      ),
                      DataCell(
                        Text('N/A'),
                      ),
                      DataCell(
                        Icon(
                          Icons.upload,
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('lemon'),
                      ),
                      DataCell(
                        Text('5'),
                      ),
                      DataCell(
                        Text('N/A'),
                      ),
                      DataCell(
                        Text('...'),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('pickle masala'),
                      ),
                      DataCell(
                        Text('2'),
                      ),
                      DataCell(
                        Text('...'),
                      ),
                      DataCell(
                        Text('...'),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('mustard seeds'),
                      ),
                      DataCell(
                        Text('2'),
                      ),
                      DataCell(
                        Text('...'),
                      ),
                      DataCell(
                        Text('...'),
                      ),
                    ],
                  ),
                ]),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                print('big button h');
              },
              child: Text('Next', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
