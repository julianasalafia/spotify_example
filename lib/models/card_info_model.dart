class CardInfoModel {
  final String image;
  final String title;
  final String type;

  const CardInfoModel({
    required this.image,
    required this.title,
    required this.type,
  });

  static CardInfoModel fromJson(Map<String, dynamic> json) {
    return CardInfoModel(
      image: json['image'],
      title: json['title'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'type': type,
    };
  }
}
