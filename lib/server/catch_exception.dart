import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prototyping/translations/locale_keys.g.dart';

class CatchException {
  CatchException({required this.message});
  final String message;

  static CatchException convertException(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout) {
        return CatchException(message: LocaleKeys.catchExTimeOfProcessing.tr());
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return CatchException(message: LocaleKeys.catchExTimeOfProcessing.tr());
      } else if (error.response == null) {
        return CatchException(message: LocaleKeys.catchExNoInternet.tr());
      } else if (error.response!.statusCode == 405) {
        return CatchException(message: LocaleKeys.catchExRequestDenied.tr());
      } else if (error.response!.statusCode == 400) {
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 500) {
        return CatchException(message: error.response!.data['message']);
      } else {
        return CatchException(message: LocaleKeys.catchExSystemError.tr());
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: LocaleKeys.catchExSystemError.tr());
    }
  }
}
