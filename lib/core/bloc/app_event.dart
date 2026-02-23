import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AppEvent {}

class StartTracking extends AppEvent {
  final String state;
  final String county;

  const StartTracking({required this.state, required this.county});

  @override
  List<Object?> get props => [state, county];
}

class StopTracking extends AppEvent {}

class SyncRequested extends AppEvent {
  final String country;
  final String state;
  final String county;
  final String caseId;

  const SyncRequested({required this.country, required this.state, required this.county, required this.caseId});

  @override
  List<Object?> get props => [country, state, county, caseId];
}
