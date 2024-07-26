import 'package:attendance_test/data/datasources/auth_remote_datasource.dart';
import 'package:attendance_test/data/models/response/auth_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  LoginBloc(
    this._authRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result = await _authRemoteDatasource.login(event.email, event.password);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
     
    });
  }
}
