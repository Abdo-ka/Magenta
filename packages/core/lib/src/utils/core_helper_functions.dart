import 'dart:convert';

import 'package:core/src/error/app_exception.dart';
import 'package:core/src/extensions.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

import '../../core.dart';
import '../models/pagination_model.dart';

class CoreHelperFunctions {
  /// Cast to [T] if possible or return null
  T? castOrNull<T>(x) => x is T ? x : null;

  static String timeOfDayToString(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';

  ///Converts from [TimeOfDay] to [DateTime]
  static DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        timeOfDay.hour,
        timeOfDay.minute,
      );

  /// Manage the state according to the value returned from callback
  static Future<void> handelApiResult<T>({
    bool Function(T)? emptyChecker,
    required FutureResult<T> Function() callback,
    required void Function(CommonState<dynamic>) emit,
  }) async {
    emit(LoadingState());
    callback().then(
      (result) => result.fold(
        (l) => emit(ErrorState(error: l)),
        (r) {
          if ((r is List && r.isEmpty) ||
              (emptyChecker != null && emptyChecker(r))) {
            emit(EmptyState());
            return;
          }

          emit(SuccessState(data: r));
        },
      ),
    );
  }

  static Future<void> handelMultiApiResult<T, E extends Helper>({
    bool Function(T)? emptyChecker,
    required FutureResult<T> Function() callback,
    required void Function(List<CommonState<dynamic>>) emit,
    required List<CommonState> state,
    required E stateEnum,
  }) async {
    //TODO search how to add constraint to Enum

    assert(E is Enum, "you can pass only enum class ");

    // emit(state..[(stateEnum as Enum).index] = LoadingState());
    emit(state..setState(stateEnum as Enum, LoadingState()));

    callback().then(
      (result) => result.fold(
        (l) => emit(state..[(stateEnum as Enum).index] = ErrorState(error: l)),
        (r) {
          if ((r is List && r.isEmpty) ||
              (emptyChecker != null && emptyChecker(r))) {
            emit(state..[(stateEnum as Enum).index] = EmptyState());
            return;
          }

          emit(state..[(stateEnum as Enum).index] = SuccessState(data: r));
        },
      ),
    );
  }

  static bool hasReachedMax(
          {required int totalPage, required int pageNumber}) =>
      totalPage == 0 ? totalPage == pageNumber : totalPage == pageNumber + 1;

  /// Appends new page to the given paging controller in case there is one,
  /// Appends last page in case there is no more,
  /// Appends error in case of failure
  static void managePaginationController<T>(
    Either<AppException, PaginationModel<T>> result,
    PagingController<int, T> controller,
    int pageNumber,
  ) {
    result.fold(
      (l) => controller.error = l,
      (r) {
        // check if it's the last page
        if (hasReachedMax(totalPage: r.totalPages, pageNumber: r.pageNumber)) {
          if (r.pageNumber == 0) controller.itemList = [];
          controller.appendLastPage(r.data);
        } else {
          if (r.pageNumber == 0) controller.itemList = [];
          controller.appendPage(r.data, pageNumber + 1);
        }
      },
    );
  }

  static DateTime fromStringToDateTime(String formattedString) =>
      DateTime.parse(formattedString);

  static String fromDateTimeToString(DateTime dateTime) =>
      DateFormat("${DateFormat.DAY} ${DateFormat.MONTH} ${DateFormat.YEAR}")
          .format(dateTime);

  static String fromTimeToString(DateTime dateTime) =>
      DateFormat.Hm().format(dateTime);

  static String? nullableFromDateToString(DateTime? date) =>
      date == null ? null : DateFormat('yyyy-MM-dd').format(date);

  static DateTime? nullableFromStringToDateTime(String? formattedString) =>
      formattedString == null ? null : DateTime.parse(formattedString);

  static String? nullableFromDateTimeToString(DateTime? dateTime) =>
      dateTime?.toIso8601String();

  static T convertStringToModel<T>(
          T Function(Map<String, dynamic> map) fromJson, String response) =>
      fromJson((jsonDecode(response) as Map).cast());

  static List<T> convertStringListToModel<T>(
          T Function(Map<String, dynamic> map) fromJson, String response) =>
      (jsonDecode(response) as List)
          .map((e) => fromJson((e as Map).cast()))
          .toList();

  static T convertMapToModel<T>(
          T Function(Map<String, dynamic> map) fromJson, Map response) =>
      fromJson((response).cast());

  static List<T> convertListToModel<T>(
          T Function(Map<String, dynamic> map) fromJson, List data) =>
      data.map((e) => fromJson((e as Map).cast())).toList();
}

mixin Helper<T> {}

extension CommonStateList on List<CommonState> {
  CommonState<T> getState<T>(Helper<T> data) {
    //todo search how to add constraint to Enum
    assert(T is Enum, "you can pass only enum class ");
    return this[(data as Enum).index] as CommonState<T>;
  }
}
