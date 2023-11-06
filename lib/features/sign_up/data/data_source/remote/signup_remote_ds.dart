import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/data/models/request_data.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/UserEntity.dart';

abstract class SignUpRemoteDS {
  Future<Either<Failures, UserEntity>>? signUp(RequestModel requestModel);
}
