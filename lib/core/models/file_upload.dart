class FileData {
  final String name;
  final bool uploaded;

  FileData({
    required this.name,
    this.uploaded = false,
  });

  FileData copyWith({String? name, bool? uploaded}) {
    return FileData(
      name: name ?? this.name,
      uploaded: uploaded ?? this.uploaded,
    );
  }
}
