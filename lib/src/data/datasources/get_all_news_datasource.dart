import '../../domain/entities/news_entity.dart';

abstract class GetAllNewsDatasource {
  Future<List<NewsEntity>> getAllNews();
}
