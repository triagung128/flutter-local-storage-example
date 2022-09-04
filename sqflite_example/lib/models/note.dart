class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
  });

  int? id;
  String? title;
  String? description;

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }

  static List<Note> toJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((item) => Note.fromJson(item)).toList();
  }
}
