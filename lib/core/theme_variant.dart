final class ThemeVariant<T> {
  const ThemeVariant({required this.light, required this.dark});

  factory ThemeVariant.value(T value) {
    return ThemeVariant(light: value, dark: value);
  }

  final T light;
  final T dark;
}
