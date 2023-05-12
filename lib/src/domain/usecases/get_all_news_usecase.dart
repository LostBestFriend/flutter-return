import '../entities/news_entity.dart';

abstract class GetAllNewsUsecase {
  Future<List<NewsEntity>> getAllNews();
}
