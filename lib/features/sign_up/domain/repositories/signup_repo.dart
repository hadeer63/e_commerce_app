import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/UserEntity.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/request_data.dart';

abstract class SignUpRepo {
  Future<Either<Failures, UserEntity>>? signUp(RequestModel requestModel);
}
