class Story {
  final String title;
  final String content;
  final String author;
  final String source;
  final List<String> tags;

  Story.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? '-',
        content = map['content'] ?? '-',
        author = map['author'] ?? '-',
        source = map['source'] ?? '-',
        tags = map['tags'] == null
            ? []
            : map['tags'].map<String>((t) => t.toString()).toList();

  Map<String, dynamic> toMap() => {
        'title': title,
        'content': content,
        'author': author,
        'tags': tags,
        'source': source,
      };
}
