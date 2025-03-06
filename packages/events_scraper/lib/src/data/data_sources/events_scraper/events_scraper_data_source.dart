import 'package:event_scraper/src/data/entities/scraped_event_entity.dart';

abstract interface class EventsScraperDataSource {
  Future<Set<ScrapedEventEntity>> getNarancaEvents();
}
