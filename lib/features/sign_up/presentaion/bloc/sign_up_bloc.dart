import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/data/data_source/remote/signup_remote_ds.dart';
import 'package:e_commerce_app/features/sign_up/data/data_source/remote/signup_remote_ds_impl.dart';
import 'package:e_commerce_app/features/sign_up/data/models/request_data.dart';
import 'package:e_commerce_app/features/sign_up/data/repositories/signup_repo_impl.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/UserEntity.dart';
import 'package:e_commerce_app/features/sign_up/domain/repositories/signup_repo.dart';
import 'package:e_commerce_app/features/sign_up/domain/use_cases/sign_up_uasecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(context) => BlocProvider.of(context);

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpButtonClicked) {
        emit(state.copyWith(screenState: ScreenState.loading));
        ApiManager apiManager = ApiManager();

        SignUpRemoteDS signUpRemoteDS = SignUpRemoteDSImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(signUpRemoteDS) as SignUpRepo;
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);

        RequestModel requestModel = RequestModel(
            name: "HAtem",
            email: "hatem555@gmail.com",
            password: "123@Hatem",
            rePassword: "123@Hatem",
            phone: "01110944558");

        var result = await signUpUseCase.call(requestModel);
        result?.fold((l) {
          emit(state.copyWith(screenState: ScreenState.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenState: ScreenState.successfully, userEntity: r));
        });
      }
    });
  }
}
