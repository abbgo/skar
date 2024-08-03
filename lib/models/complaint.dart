class Complaint {
  final String id, textTM, textRU;

  const Complaint(
      {required this.id, required this.textTM, required this.textRU});

  factory Complaint.defaultComplaint() {
    return const Complaint(id: '', textTM: '', textRU: '');
  }

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'],
      textTM: json['text_tm'],
      textRU: json['text_ru'],
    );
  }
}
