class Inkuru {
  final String id;
  final String title;
  final String content;
  final String author;
  final String source;
  final DateTime createdTime;
  final dynamic bookmarks;
  final String imageUrl;
  final List<String> tags;
  final String language;

  Inkuru.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? '-',
        id = map['id'] ?? '-',
        imageUrl = map['imageUrl'] ?? '-',
        content = map['content'] ?? '-',
        author = map['author'] ?? '-',
        createdTime = (map['createdTime'])?.toDate() ?? DateTime.now(),
        source = map['source'] ?? '-',
        language = map['language'] ?? 'Kinyarwanda',
        tags = map['tags'] == null
            ? []
            : map['tags'].map<String>((t) => t.toString()).toList(),
        bookmarks = map['bookmarks'] ?? {};
}
