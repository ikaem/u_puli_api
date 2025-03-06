import 'package:database_wrapper/database_wrapper.dart';
import 'package:env_vars_wrapper/env_vars_wrapper.dart';
import 'package:event_scraper/src/data/data_sources/events_scraper/events_scraper_data_source.dart';
import 'package:event_scraper/src/data/data_sources/events_scraper/events_scraper_data_source_impl.dart';
import 'package:event_scraper/src/domain/repositories/events_loader_repository.dart';
import 'package:event_scraper/src/domain/repositories/events_loader_repository_impl.dart';
import 'package:event_scraper/src/domain/use_cases/load_naranca_events_use_case.dart';
import 'package:event_scraper/src/events_scraper.dart';
import 'package:event_scraper/src/presentation/controllers/events_scraper_controller.dart';
import 'package:event_scraper/src/wrappers/puppeteer/naranca_puppeteer_scrapper_wrapper.dart';

Future<void> runEventsScraper() async {
  final EnvVarsWrapper envVarsWrapper = EnvVarsWrapper();
  final DatabaseWrapper databaseWrapper = _getInitializedDatabaseWrapper(
    envVarsWrapper: envVarsWrapper,
  );
  final EventsScraperController eventsScraperController =
      _getInitializedEventsScraperController();

  final EventsScraper eventsScraper = EventsScraper(
    eventsScraperController: eventsScraperController,
  );

  await eventsScraper.run();

  await databaseWrapper.driftWrapper.close();
}

DatabaseWrapper _getInitializedDatabaseWrapper({
  required EnvVarsWrapper envVarsWrapper,
}) {
  final databaseWrapper = DatabaseWrapper.app(
    endpointData: DatabaseEndpointDataValue(
      pgHost: envVarsWrapper.pgHost,
      pgDatabase: envVarsWrapper.pgDatabase,
      pgUser: envVarsWrapper.pgUser,
      pgPassword: envVarsWrapper.pgPassword,
      pgPort: envVarsWrapper.pgPort,
    ),
  );

  databaseWrapper.initialize();

  return databaseWrapper;
}

EventsScraperController _getInitializedEventsScraperController() {
  // puppeteer wrappers
  final NarancaPuppeteerScraperWrapper narancaPuppeteerScraperWrapper =
      NarancaPuppeteerScraperWrapper();

  // data sources
  final EventsScraperDataSource eventsScraperDataSource =
      EventsScraperDataSourceImpl(
        narancaPuppeteerScraperWrapper: narancaPuppeteerScraperWrapper,
      );

  // repositories
  final EventsLoaderRepository eventsLoaderRepository =
      EventsLoaderRepositoryImpl(
        eventsScraperDataSource: eventsScraperDataSource,
      );

  // use cases
  final LoadNarancaEventsUseCase loadNarancaEventsUseCase =
      LoadNarancaEventsUseCase(eventsLoaderRepository: eventsLoaderRepository);

  // controller
  final EventsScraperController eventsScraperController =
      EventsScraperController(
        loadNarancaEventsUseCase: loadNarancaEventsUseCase,
      );

  return eventsScraperController;
}
