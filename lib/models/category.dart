class Category {
  final String id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<Category> categoryList = categoryData
    .map((item) => Category(
          id: item['id'] ?? "",
          name: item['name'] ?? "",
          image: item['image'] ?? "",
        ))
    .toList();

var categoryData = [
  {"id": "1", "name": "Breakfast", "image": "breaki.jpg"},
  {"id": "2", "name": "Lunch", "image": "beef.jpeg"},
  {"id": "3", "name": "Dinner", "image": "chicken.jpg"},
  {"id": "4", "name": "Snacks", "image": "noheat.jpg"},
  {"id": "5", "name": "Vegetarian", "image": "vege.jpg"},
  {"id": "6", "name": "Vegan", "image": "pork.jpg"},
  {"id": "7", "name": "Low Carb", "image": "chicken.jpg"},
  {"id": "8", "name": "High Protein", "image": "pork.jpg"},
  {"id": "9", "name": "Low Budget", "image": "beef.jpeg"},
  {"id": "10", "name": "Quick & Easy", "image": "breaki.jpg"}
];
