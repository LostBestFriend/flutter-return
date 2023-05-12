import 'package:app_test/src/data/datasources/get_all_news_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/news_entity.dart';
import '../../dtos/news_dto.dart';

class GetAllNewsRemoteDatasourceImp implements GetAllNewsDatasource {
  final Dio _dio = Dio();

  @override
  Future<List<NewsEntity>> getAllNews() async {
    List<NewsEntity> news = [];

    try {
      final response = await _dio.get(
        'https://api.spaceflightnewsapi.net/v4/articles/?has_event=true&has_launch=true',
      );

      news = List.from(
        response.data['results'].map((news) {
          return NewsDto.fromMap(news);
        }),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return news;
  }
}
