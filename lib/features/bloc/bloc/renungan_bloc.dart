import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_remote_datasources.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_response_models.dart';

part 'renungan_event.dart';
part 'renungan_state.dart';
part 'renungan_bloc.freezed.dart';

class RenunganBloc extends Bloc<RenunganEvent, RenunganState> {
  final DataRenunganRemoteDatasources dataRenunganRemoteDatasources;
  RenunganBloc(this.dataRenunganRemoteDatasources) : super(_Initial()) {
    on<_FetchData>((event, emit) async {
      emit(_Loading());
      try {
        var data = await dataRenunganRemoteDatasources.fetchData();
        emit(_Fetch(data));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
