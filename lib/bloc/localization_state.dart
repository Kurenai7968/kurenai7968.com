part of 'localization_bloc.dart';

@immutable
abstract class LocalizationState extends Equatable {
  final Locale? locale;

  LocalizationState(this.locale);
  @override
  List<Object?> get props => [locale];
}

class LocalizationInitial extends LocalizationState {
  LocalizationInitial(Locale? locale) : super(locale);
}

class LocalizationLoading extends LocalizationState {
  LocalizationLoading(Locale? locale) : super(locale);
}
