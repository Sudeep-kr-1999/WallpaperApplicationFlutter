class WallpaperModel {
  String photgrapher;
  String photographerURL;
  int photgrapherID;
  SrcModel src;
  WallpaperModel(
      {required this.photgrapher,
      required this.photographerURL,
      required this.photgrapherID,
      required this.src});

  factory WallpaperModel.froMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographerURL: jsonData["photographer_url"],
      photgrapherID: jsonData["photographer_id"],
      photgrapher: jsonData["photographer"],
    );
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;
  SrcModel(
      {required this.original, required this.small, required this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      small: jsonData["small"],
    );
  }
}
