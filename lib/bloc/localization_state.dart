part of 'localization_bloc.dart';

@immutable
abstract class LocalizationState {
  final Locale? locale;

  LocalizationState(this.locale);
}

class LocaleUpdated extends LocalizationState {
  LocaleUpdated(Locale? locale) : super(locale);
}
