class IPlace {
  late String name;
  late String image;
  late double rating;
  late String state;
  late int numberOfRates;
  late List<String> images;
  late String description;
  IPlace(
      {required this.name,
      required this.image,
      required this.rating,
      required this.state,
      this.numberOfRates = 4,
      this.description =
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
      this.images = const [
        "assets/constantine-algeria.jpg",
        "assets/Algiers-Cathedral.jpg",
        "assets/Oran-Palms.jpg"
      ]});
}
