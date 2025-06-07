import 'package:flutter/material.dart' show ChangeNotifier, ThemeMode, Locale;

final class PreferenceProvider with ChangeNotifier {
  PreferenceProvider() {
    _state = PreferenceState(
      locale: const Locale('en_US'),
      themeMode: ThemeMode.light,
    );
  }

  late PreferenceState _state;
  PreferenceState get state => _state;

  Locale get locale => _state.locale;
  set locale(Locale value) {
    _updateState(_state.copyWith(locale: value));
  }

  ThemeMode get themeMode => _state.themeMode;
  set themeMode(ThemeMode value) {
    _updateState(_state.copyWith(themeMode: value));
  }

  void _updateState(PreferenceState value) {
    if (value != _state) {
      _state = value;
      notifyListeners();
    }
  }
}

final class PreferenceState {
  PreferenceState({required this.locale, required this.themeMode});

  final Locale locale;
  final ThemeMode themeMode;

  PreferenceState copyWith({Locale? locale, ThemeMode? themeMode}) {
    return PreferenceState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferenceState &&
          runtimeType == other.runtimeType &&
          locale == other.locale &&
          themeMode == other.themeMode;

  @override
  int get hashCode => locale.hashCode ^ themeMode.hashCode;
}
