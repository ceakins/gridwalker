import 'package:equatable/equatable.dart';

enum AppStatus { initial, loading, authenticated, ready, tracking, syncing, error }

class AppState extends Equatable {
  final AppStatus status;
  final String? errorMessage;
  final bool isTracking;
  final bool isSyncing;

  const AppState({
    this.status = AppStatus.initial,
    this.errorMessage,
    this.isTracking = false,
    this.isSyncing = false,
  });

  AppState copyWith({
    AppStatus? status,
    String? errorMessage,
    bool? isTracking,
    bool? isSyncing,
  }) {
    return AppState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      isTracking: isTracking ?? this.isTracking,
      isSyncing: isSyncing ?? this.isSyncing,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, isTracking, isSyncing];
}
