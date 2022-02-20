import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgURL;
  const ImageView({Key? key, required this.imgURL}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgURL,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgURL,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        color: const Color(0xff1c1b1b).withOpacity(0.8),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                                colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                        child: Column(
                          children: const [
                            Text("Set Wallpaper",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "Image will be saved in gallary",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}