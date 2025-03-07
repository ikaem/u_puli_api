import 'dart:io';

import 'package:database_wrapper/database_wrapper.dart';
import 'package:env_vars_wrapper/env_vars_wrapper.dart';
import 'package:u_puli_api/src/app.dart';
import 'package:u_puli_api/src/app_router.dart';
import 'package:u_puli_api/src/features/events/data/data_sources/events_data_source.dart';
import 'package:u_puli_api/src/features/events/data/data_sources/events_data_source_impl.dart';
import 'package:u_puli_api/src/features/events/domain/repositories/events_repository.dart';
import 'package:u_puli_api/src/features/events/domain/repositories/events_repository_impl.dart';
import 'package:u_puli_api/src/features/events/domain/use_cases/get_event_use_case.dart';
import 'package:u_puli_api/src/features/events/domain/use_cases/get_events_use_case.dart';
import 'package:u_puli_api/src/features/events/presentation/controllers/get_event_controller.dart';
import 'package:u_puli_api/src/features/events/presentation/controllers/get_events_controller.dart';
import 'package:u_puli_api/src/features/events/presentation/router/events_router.dart';
import 'package:u_puli_api/src/wrappers/get_id/get_it_wrapper.dart';

Future<void> bootstrap() async {
  final EnvVarsWrapper envVarsWrapper = EnvVarsWrapper();

  final DatabaseWrapper databaseWrapper = _getInitializedDatabaseWrapper(
    envVarsWrapper: envVarsWrapper,
  );
  final AppRouter appRouter = _getInitializedAppRouter(
    databaseWrapper: databaseWrapper,
  );
// TODO move to env vars wrapper
  final int port = int.parse(Platform.environment['PORT'] ?? '8080');
  final InternetAddress ip = InternetAddress.anyIPv4;

  final App app = App(
    ip: ip,
    port: port,
    appRouter: appRouter,
  );

  final HttpServer server = await app.start();
  print('Server listening on port ${server.port}, on IP address ${app.ip}');
}

DatabaseWrapper _getInitializedDatabaseWrapper({
  required EnvVarsWrapper envVarsWrapper,
}) {
  final DatabaseEndpointDataValue endpointData = DatabaseEndpointDataValue(
    pgHost: envVarsWrapper.pgHost,
    pgDatabase: envVarsWrapper.pgDatabase,
    pgUser: envVarsWrapper.pgUser,
    pgPassword: envVarsWrapper.pgPassword,
    pgPort: envVarsWrapper.pgPort,
  );

  final DatabaseWrapper databaseWrapper = DatabaseWrapper.app(
    endpointData: endpointData,
  );

  databaseWrapper.initialize();

  getIt.registerSingleton<DatabaseWrapper>(databaseWrapper);

  final anotherDbWrapper = getIt.get<DatabaseWrapper>();

  print('anotherDbWrapper: $anotherDbWrapper');

  return databaseWrapper;
}

// TODO split this into multiple functions
AppRouter _getInitializedAppRouter({
  required DatabaseWrapper databaseWrapper,
}) {
  // data surces
  final EventsDataSource eventsDataSource = EventsDataSourceImpl(
    databaseWrapper: databaseWrapper,
  );

  // repositories
  final EventsRepository eventsRepository =
      EventsRepositoryImpl(eventsDataSource: eventsDataSource);

  // use cases
  final GetEventUseCase getEventUseCase =
      GetEventUseCase(eventsRepository: eventsRepository);
  final GetEventsUseCase getEventsUseCase =
      GetEventsUseCase(eventsRepository: eventsRepository);

  // controllers
  final GetEventController getEventController = GetEventController(
    getEventUseCase: getEventUseCase,
  );
  final GetEventsController getEventsController =
      GetEventsController(getEventsUseCase: getEventsUseCase);

  final EventsRouter eventsRouter = EventsRouter(
    getEventController: getEventController,
    getEventsController: getEventsController,
  );

  final AppRouter appRouter = AppRouter(eventsRouter: eventsRouter);

  return appRouter;
}
