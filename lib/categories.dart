class Categories {
  final String name;
  final String urlimage;
  final String iconImage;
  Categories({this.name, this.urlimage, this.iconImage});
}

List<Categories> dummyCategories = [
  Categories(
    name: "Teeth",
    urlimage: "images/teeth2.jpg",
    iconImage: "images/teeth.png",
  ),
  Categories(
    name: "Pregnancy",
    urlimage: "images/pregnant1.jpg",
    iconImage: "images/woman.png",
  ),
  Categories(
    name: "Eye",
    urlimage: "images/eye1.jpg",
    iconImage: "images/view.png",
  ),
  Categories(
    name: "Klinical Pshycology",
    urlimage: "images/consultation.jpg",
    iconImage: "images/mental.png",
  ),
];
