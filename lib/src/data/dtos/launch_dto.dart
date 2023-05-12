import 'package:app_test/src/domain/entities/launch_entity.dart';

class LaunchDto extends LaunchEntity {
  LaunchDto({
    required String launchId,
    required String provider,
  }) : super(launchId: launchId, provider: provider);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'launch_id': launchId});
    result.addAll({'provider': provider});

    return result;
  }

  factory LaunchDto.fromMap(Map<String, dynamic> map) {
    return LaunchDto(
      launchId: map['launch_id'] ?? '',
      provider: map['provider'] ?? '',
    );
  }
}
