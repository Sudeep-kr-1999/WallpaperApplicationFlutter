import 'package:flutter/material.dart';
import 'package:wallpaperapplication/views/imageview.dart';
import '../model/wallpapermodel.dart';

Widget brandName() {
  return RichText(
    text: const TextSpan(
      // text: 'Wallpaper',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black87)),
        TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue)),
      ],
    ),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: wallpapers
            .map((wallpaper) => (GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImageView(imgURL: wallpaper.src.portrait)));
                    },
                    child: Hero(
                      tag: wallpaper.src.portrait,
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              wallpaper.src.portrait,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                )))
            .toList()),
  );
}
