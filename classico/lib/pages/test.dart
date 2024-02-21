import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

class DataTile extends StatelessWidget {
  final Map<String, dynamic> data;

  const DataTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blueAccent.shade100,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent,
            ),
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Add your logic when the file icon is pressed
              },
              child: Icon(
                CupertinoIcons.doc,
                size: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  data['Title'],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  data['Description'],
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  data['Link'],
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Replace 'assets/data.json' with your actual file path
  final String dataFilePath = 'assets/json/dummy.json';
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final String jsonString = await rootBundle.loadString(dataFilePath);
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      setState(() {
        // print(jsonData);
        data = jsonData["dummy_data"]; // as List<Map<String, dynamic>>;
        // print(data[0]);
      });
    } catch (error) {
      print(error); // Handle errors gracefully
      // Handle cases where data loading fails (e.g., display an error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Data Containers'),
      // ),
      body: data.isEmpty
          ? const Center(child: Text('Loading data...'))
          : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => DataTile(data: data[index]),
      ),
    );
  }
}