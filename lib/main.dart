import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/observer.dart';
import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
