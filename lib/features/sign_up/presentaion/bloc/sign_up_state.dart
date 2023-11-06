part of 'sign_up_bloc.dart';

enum ScreenState { loading, successfully, failures, init }

@immutable
class SignUpState {
  ScreenState? screenState;
  UserEntity? userEntity;
  Failures? failures;

  SignUpState({this.screenState, this.userEntity, this.failures});

  SignUpState copyWith(
      {ScreenState? screenState, UserEntity? userEntity, Failures? failures}) {
    return SignUpState(
        screenState: screenState ?? this.screenState,
        userEntity: userEntity ?? this.userEntity,
        failures: failures ?? this.failures);
  }
}

class SignUpInitial extends SignUpState {
  SignUpInitial() : super(screenState: ScreenState.init);
}
