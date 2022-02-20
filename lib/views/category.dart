import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapplication/api.dart';
import 'package:wallpaperapplication/model/wallpapermodel.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapplication/widgets/widget.dart';

class Category extends StatefulWidget {
  final String categoryName;
  const Category({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallpaperModel> wallpapers = [];
  getSearchedWallpapaers(String query) async {
    var url = Uri.parse(
        'https://api.pexels.com/v1/search?query=$query&per_page=80');
    var response = await http.get(url, headers: {"Authorization": apiKey});
    setState(() {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData['photos'].forEach((element) {
        WallpaperModel wallpaper = WallpaperModel.froMap(element);
        wallpapers.add(wallpaper);
      });
    });
  }

  @override
  void initState() {
    getSearchedWallpapaers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: brandName(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
