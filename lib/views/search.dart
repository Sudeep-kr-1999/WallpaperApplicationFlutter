import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapplication/api.dart';
import 'package:wallpaperapplication/model/wallpapermodel.dart';
import '../widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;
  const Search({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = [];
  @override
  void initState() {
    getSearchedWallpapaers(widget.searchQuery);
    searchController.text=widget.searchQuery;
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: brandName(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(child: const Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
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
