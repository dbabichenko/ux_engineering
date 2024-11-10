// bus_schedule_model.dart

class RouteStop {
  final String stopName;
  final List<String> times;

  RouteStop({required this.stopName, required this.times});

  factory RouteStop.fromJson(Map<String, dynamic> json) {
    return RouteStop(
      stopName: json['stop_name'],
      times: List<String>.from(json['times']),
    );
  }
}

class BusRoute {
  final String routeId;
  final String routeName;
  final List<RouteStop> stops;

  BusRoute({required this.routeId, required this.routeName, required this.stops});

  factory BusRoute.fromJson(Map<String, dynamic> json) {
    return BusRoute(
      routeId: json['route_id'],
      routeName: json['route_name'],
      stops: (json['stops'] as List).map((i) => RouteStop.fromJson(i)).toList(),
    );
  }
}
