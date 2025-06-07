class ServiceLocator {
  factory ServiceLocator() => _instance;

  ServiceLocator._internal();
  static final ServiceLocator _instance = ServiceLocator._internal();
  final Map<Type, Object> _instances = {};

  void registerSingleton<T extends Object>(T instance) {
    _instances[T] = instance;
  }

  void registerFactory<T extends Object>(T Function() factory) {
    _instances[T] = factory;
  }

  T get<T extends Object>() {
    final instance = _instances[T];

    if (instance == null) {
      throw Exception('No instance registered for type $T');
    }

    if (instance is T Function()) {
      return instance();
    }

    return instance as T;
  }

  void reset() {
    _instances.clear();
  }
}

final locator = ServiceLocator();
