class DownloadURL {
  final String host;
  final String url;
  final String size;
  final String resolution;

  const DownloadURL({
    required this.host,
    required this.url,
    required this.size,
    required this.resolution,
  });

  factory DownloadURL.fromJson(Map<String, dynamic> json) {
    return DownloadURL(
      host: json['host'] as String,
      url: json['url'] as String,
      size: json['size'] as String,
      resolution: json['resolution'] as String,
    );
  }

  @override
  String toString() {
    return 'DownloadURL{host: $host, url: $url, size: $size, resolution: $resolution}';
  }
}
