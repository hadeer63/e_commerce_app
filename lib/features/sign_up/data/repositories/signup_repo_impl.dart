import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/sign_up/data/data_source/remote/signup_remote_ds.dart';
import 'package:e_commerce_app/features/sign_up/data/models/user_model.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/UserEntity.dart';
import 'package:e_commerce_app/features/sign_up/domain/repositories/signup_repo.dart';

import '../../../../core/error/failures.dart';
import '../models/request_data.dart';

class SignUpRepoImpl implements SignUpRepo {
  // SignUpLocalDS signUpLocalDS;
  SignUpRemoteDS signUpRemoteDS;

  SignUpRepoImpl(this.signUpRemoteDS);

  @override
  Future<Either<Failures, UserEntity>>? signUp(RequestModel requestModel) {
    try {
      return signUpRemoteDS.signUp(requestModel);
    } catch (e) {
      throw Exception();
    }
  }
}
