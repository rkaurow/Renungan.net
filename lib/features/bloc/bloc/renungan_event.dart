part of 'renungan_bloc.dart';

@freezed
class RenunganEvent with _$RenunganEvent {
  const factory RenunganEvent.started() = _Started;
  const factory RenunganEvent.fetchData() = _FetchData;
}
