part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent {}

class ChangeLocale extends LocalizationEvent {
  final Locale locale;

  ChangeLocale(this.locale);
}
