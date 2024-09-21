import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../error/app_exception.dart';

Future<Either<AppException, T>> throwAppException<T>(
    FutureOr<T> Function() call) async {
  try {
    return Right(await call());
  } on AppException catch (e) {
    showMessage(e.message);
    return Left(e);
  } on SocketException catch (e) {
    showMessage(e.message);
    return Left(AppNetworkException(
        message: e.message,
        reason: AppNetworkExceptionReason.noInternet,
        exception: e));
  } on Exception catch (e) {
    showMessage(e.toString());

    return Left(
      AppException.unknown(
        exception: e,
        message: e.toString(),
      ),
    );
  } catch (e, s) {
    showMessage(e.toString());

    log(e.toString(), stackTrace: s);
    return Left(
      AppException.unknown(
        exception: e,
        message: e.toString(),
      ),
    );
  }
}

void showMessage(String message, {bool isSuccess = false}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccess ? Colors.greenAccent : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
