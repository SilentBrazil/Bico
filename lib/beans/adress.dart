class Address {
  String cep;
  String number;
  String urlComprovAddress;

  Address({this.cep, this.number, this.urlComprovAddress});

  Address.fromMap(Map<String, dynamic> json) {
    cep = json['cep'];
    number = json['number'];
    urlComprovAddress = json['urlComprovAddress'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['number'] = this.number;
    data['urlComprovAddress'] = this.urlComprovAddress;
    return data;
  }
}