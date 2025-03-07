import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:u_puli_api/src/app_router.dart';

class App {
  const App({
    required this.ip,
    required this.port,
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;
  final InternetAddress ip;
  final int port;

  Future<HttpServer> start() async {
    final handler = Pipeline()
        .addMiddleware(logRequests())
        .addHandler(_appRouter.router.call);

    final server = await serve(handler, ip, port);
    return server;
  }
}
