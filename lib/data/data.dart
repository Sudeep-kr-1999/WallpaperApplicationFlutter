import 'package:wallpaperapplication/model/categories_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];

  // street art
  CategoriesModel streetart = CategoriesModel();
  streetart.imgURL =
      "https://images.pexels.com/photos/6188/street-graffiti-bricks-wall.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  streetart.categoriesName = "Street Art";
  categories.add(streetart);

  // widldlife
  CategoriesModel wildlife = CategoriesModel();
  wildlife.imgURL =
      "https://images.pexels.com/photos/247431/pexels-photo-247431.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  wildlife.categoriesName = "Wild Life";
  categories.add(wildlife);

  // nature
  CategoriesModel nature = CategoriesModel();
  nature.imgURL =
      "https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  nature.categoriesName = "Nature";
  categories.add(nature);

  // city
  CategoriesModel city = CategoriesModel();
  city.imgURL =
      "https://images.pexels.com/photos/1105766/pexels-photo-1105766.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  city.categoriesName = "City";
  categories.add(city);

  // motivation
  CategoriesModel motivation = CategoriesModel();
  motivation.imgURL =
      "https://images.pexels.com/photos/2045600/pexels-photo-2045600.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  motivation.categoriesName = "Motivation";
  categories.add(motivation);

  // bikes
  CategoriesModel bikes = CategoriesModel();
  bikes.imgURL =
      "https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  bikes.categoriesName = "Bikes";
  categories.add(bikes);

  // cars
  CategoriesModel cars = CategoriesModel();
  cars.imgURL =
      "https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cars.categoriesName = "Cars";
  categories.add(cars);

  return categories;
}
