class Category {
  String key;

  String posterImage;
  String subtitle;
  String title;
  String titleColor;

  Category(
      {
        this.posterImage,
        this.subtitle,
        this.title,
        this.titleColor,
      });

  Category.fromMap(Map<String, dynamic> json, String key) {
    this.key = key;
    posterImage = json['posterImage'];
    subtitle = json['subtitle'];
    title = json['title'];
    titleColor = json['titleColor'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posterImage'] = this.posterImage;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['titleColor'] = this.titleColor;

    return data;
  }
}