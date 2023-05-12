import '../entities/news_entity.dart';

abstract class GetAllNewsRepository {
  Future<List<NewsEntity>> getAllNews();
}
