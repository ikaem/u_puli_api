/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/database_wrapper.dart';
export "src/wrappers/drift/drift_wrapper.dart";
export "src/entities/event_entity.dart";
export "src/query_executors/psql_query_executor_wrapper.dart";
export "src/query_executors/test_psql_query_executor_wrapper.dart";
export "src/values/database_endpoint_data_value.dart";
export "src/values/store_event_entity_value.dart";
export "src/utils/converters/events_converter.dart";

// TODO: Export any libraries intended for clients of this package.


// TODO this should not be called database_wrapper - it should be called database helper 
// - wrappers are wrappers around libraries
// - helpers are helpers that use wrappers - or maybe they dont use wrappers - but they are local to the project, created by the project