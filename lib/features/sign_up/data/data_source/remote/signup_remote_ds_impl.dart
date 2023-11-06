import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_point.dart';
import 'package:e_commerce_app/features/sign_up/data/data_source/remote/signup_remote_ds.dart';
import 'package:e_commerce_app/features/sign_up/data/models/request_data.dart';
import 'package:e_commerce_app/features/sign_up/data/models/user_model.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/UserEntity.dart';

import '../../../../../core/error/failures.dart';

class SignUpRemoteDSImpl implements SignUpRemoteDS {
  ApiManager apiManager;

  SignUpRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, UserEntity>>? signUp(
      RequestModel requestModel) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.signup, body: requestModel.toJson());

      UserModel userModel = UserModel.fromJson(response.data);

      print(userModel.message);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
