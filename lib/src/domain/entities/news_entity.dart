import 'event_entity.dart';
import 'launch_entity.dart';

class NewsEntity {
  final int id;
  final String title;
  final String url;
  final String imageURL;
  final String newsSiteName;
  final String summary;
  final String publishedAt;
  final String updatedAt;
  final bool featured;
  final List<LaunchEntity> launches;
  final List<EventEntity> events;

  NewsEntity({
    required this.id,
    required this.title,
    required this.url,
    required this.imageURL,
    required this.newsSiteName,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });
}
