import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/UserEntity.dart';

import '../../data/models/request_data.dart';
import '../repositories/signup_repo.dart';

class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<Either<Failures, UserEntity>>? call(RequestModel requestModel) =>
      signUpRepo.signUp(requestModel);
}
