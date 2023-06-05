class StorageProduct {
  String name;
  String id;
  String lastUpdated;
  int count;
  String docID;

  StorageProduct({
    required this.name,
    required this.id,
    required this.lastUpdated,
    required this.count,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'lastUpdated': lastUpdated,
        'count': count,
      };

  StorageProduct.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        lastUpdated = json['lastUpdated'],
        count = json['count'],
        docID = json['docID'] ?? "";
}
