import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapplication/api.dart';
import 'package:wallpaperapplication/data/data.dart';
import 'package:wallpaperapplication/model/categories_model.dart';
import 'package:wallpaperapplication/model/wallpapermodel.dart';
import 'package:wallpaperapplication/views/category.dart';
import 'package:wallpaperapplication/views/search.dart';
import 'package:wallpaperapplication/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categoriesModel = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = TextEditingController();
  getTrendingWallpapaers() async {
    var url = Uri.parse("https://api.pexels.com/v1/curated?per_page=80");
    var response = await http.get(url, headers: {"Authorization": apiKey});

    setState(() {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData['photos'].forEach((element) {
        WallpaperModel wallpaper = WallpaperModel.froMap(element);
        wallpapers.add(wallpaper);
      });
    });
  }

  // it will call when application started
  @override
  void initState() {
    categoriesModel = getCategories();
    getTrendingWallpapaers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: brandName(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                        searchQuery:
                                            searchController.text.toString(),
                                      )));
                        },
                        child: Container(child: const Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    itemCount: categoriesModel.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoriesTile(
                          title: categoriesModel[index].categoriesName,
                          imgURL: categoriesModel[index].imgURL);
                    },
                  ),
                ),
                wallpapersList(wallpapers: wallpapers, context: context),
              ],
            )),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgURL;
  final String title;
  const CategoriesTile({Key? key, required this.title, required this.imgURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Category(categoryName: title.toLowerCase())));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgURL,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
