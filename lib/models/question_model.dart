class Question {
  String? soru;
  String? cevap;

  Question({required this.soru, required this.cevap});

  Question.fromJson(Map<String, dynamic> json) {
    soru = json['soru'];
    cevap = json['cevap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['soru'] = soru;
    data['cevap'] = cevap;
    return data;
  }
}
