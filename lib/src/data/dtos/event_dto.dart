import 'package:app_test/src/domain/entities/event_entity.dart';

class EventDto extends EventEntity {
  EventDto({
    required int eventId,
    required String provider,
  }) : super(eventId: eventId, provider: provider);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'event_id': eventId});
    result.addAll({'provider': provider});

    return result;
  }

  factory EventDto.fromMap(Map<String, dynamic> map) {
    return EventDto(
      eventId: map['event_id']?.toInt() ?? 0,
      provider: map['provider'] ?? '',
    );
  }
}
