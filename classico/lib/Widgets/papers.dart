import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wish/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:wish/Widgets/datatile.dart';




class Papers extends StatefulWidget {
  const Papers({Key? key}) : super(key: key);

  @override
  State<Papers> createState() => _PapersState();
}

class _PapersState extends State<Papers> {
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
      body: data.isEmpty
          ? const Center(child: Text('Loading data...'))
          : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => DataTile(data: data[index]),
      ),
    );
  }
}