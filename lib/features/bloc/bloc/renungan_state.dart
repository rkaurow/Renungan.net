part of 'renungan_bloc.dart';

@freezed
class RenunganState with _$RenunganState {
  const factory RenunganState.initial() = _Initial;
  const factory RenunganState.loading() = _Loading;
  const factory RenunganState.fetchData(
      List<DataRenunganModels> dataRenunganModels) = _Fetch;
  const factory RenunganState.error(String message) = _Error;
}
