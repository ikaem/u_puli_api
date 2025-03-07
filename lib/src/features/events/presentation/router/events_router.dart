import 'package:shelf_router/shelf_router.dart';
import 'package:u_puli_api/src/features/events/presentation/controllers/get_event_controller.dart';
import 'package:u_puli_api/src/features/events/presentation/controllers/get_events_controller.dart';

// NOTE: this router is independent - placed after "events" path in the main router
class EventsRouter {
  EventsRouter(
      {required GetEventController getEventController,
      required GetEventsController getEventsController})
      : _router = Router() {
    _router.get("/", getEventsController.call);

    // Dynamic routes have to be last, so as not to catch other routes requests
    _router.get("/<id>", getEventController.call);
  }

  final Router _router;
  Router get router => _router;
}
