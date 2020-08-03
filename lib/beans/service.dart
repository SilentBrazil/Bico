import 'job.dart';

class Service {
  String key;
  double averagePrice;
  double minPrice;
  String posterImage;
  String subtitle;
  String title;
  String titleColor;

  Service(
      {this.averagePrice,
        this.minPrice,
        this.posterImage,
        this.subtitle,
        this.title,
        this.titleColor,
        });

  Service.fromMap(Map<String, dynamic> json, String key) {
    this.key = key;
    averagePrice = json['averagePrice'];
    minPrice = json['minPrice'];
    posterImage = json['posterImage'];
    subtitle = json['subtitle'];
    title = json['title'];
    titleColor = json['titleColor'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['averagePrice'] = this.averagePrice;
    data['minPrice'] = this.minPrice;
    data['posterImage'] = this.posterImage;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['titleColor'] = this.titleColor;

    return data;
  }
}