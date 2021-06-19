part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeLocale extends LocalizationEvent {
  final Locale locale;

  ChangeLocale(this.locale);
}
