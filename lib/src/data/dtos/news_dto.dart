import 'package:app_test/src/data/dtos/event_dto.dart';
import 'package:app_test/src/domain/entities/news_entity.dart';

import 'launch_dto.dart';

class NewsDto extends NewsEntity {
  late final List<LaunchDto> launchesDto;
  late final List<EventDto> eventsDto;

  NewsDto({
    required int id,
    required String title,
    required String url,
    required String imageURL,
    required String newsSiteName,
    required String summary,
    required String publishedAt,
    required String updatedAt,
    required bool featured,
    required this.launchesDto,
    required this.eventsDto,
  }) : super(
          id: id,
          title: title,
          url: url,
          imageURL: imageURL,
          newsSiteName: newsSiteName,
          summary: summary,
          publishedAt: publishedAt,
          updatedAt: updatedAt,
          featured: featured,
          launches: launchesDto,
          events: eventsDto,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'url': url});
    result.addAll({'image_url': imageURL});
    result.addAll({'news_site': newsSiteName});
    result.addAll({'summary': summary});
    result.addAll({'published_at': publishedAt});
    result.addAll({'updated_at': updatedAt});
    result.addAll({'featured': featured});
    result.addAll({'launches': launchesDto.map((x) => x.toMap()).toList()});
    result.addAll({'events': eventsDto.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NewsDto.fromMap(Map<String, dynamic> map) {
    return NewsDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      imageURL: map['image_url'] ?? '',
      newsSiteName: map['news_site'] ?? '',
      summary: map['summary'] ?? '',
      publishedAt: map['published_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      featured: map['featured'] ?? false,
      launchesDto: List<LaunchDto>.from(map['launches']?.map((x) => LaunchDto.fromMap(x))),
      eventsDto: List<EventDto>.from(map['events']?.map((x) => EventDto.fromMap(x))),
    );
  }
}
