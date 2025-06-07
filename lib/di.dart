import 'core.dart';
import 'data.dart';
import 'domain.dart';
import 'presentation.dart';

void setupDependencies() {
  // Register data sources
  locator.registerSingleton<LocalDataSource>(LocalDataSource());

  // Register repositories
  locator.registerSingleton<ProductRepository>(
    ProductRepository(locator.get<LocalDataSource>()),
  );
  locator.registerSingleton<CartRepository>(
    CartRepository(locator.get<LocalDataSource>()),
  );
  locator.registerSingleton<UserRepository>(
    UserRepository(locator.get<LocalDataSource>()),
  );

  // Register use cases
  locator.registerSingleton<FetchProductsUseCase>(
    FetchProductsUseCase(locator.get<ProductRepository>()),
  );
  locator.registerSingleton<FetchProductsCategoryUseCase>(
    FetchProductsCategoryUseCase(locator.get<ProductRepository>()),
  );
  locator.registerSingleton<SearchProductsUseCase>(
    SearchProductsUseCase(locator.get<ProductRepository>()),
  );
  locator.registerSingleton<GetProductUseCase>(
    GetProductUseCase(locator.get<ProductRepository>()),
  );
  locator.registerSingleton<FavouriteProductUseCase>(
    FavouriteProductUseCase(locator.get<ProductRepository>()),
  );
  locator.registerSingleton<GetCartUseCase>(
    GetCartUseCase(locator.get<CartRepository>()),
  );
  locator.registerSingleton<UpdateCartUseCase>(
    UpdateCartUseCase(locator.get<CartRepository>()),
  );
  locator.registerSingleton<GetUserUseCase>(
    GetUserUseCase(locator.get<UserRepository>()),
  );

  // Register providers using factory pattern
  locator.registerFactory<ProductProvider>(
    () => ProductProvider(
      fetchProducts: locator.get<FetchProductsUseCase>(),
      fetchProductsCategory: locator.get<FetchProductsCategoryUseCase>(),
      searchProducts: locator.get<SearchProductsUseCase>(),
      getProduct: locator.get<GetProductUseCase>(),
      favoriteProduct: locator.get<FavouriteProductUseCase>(),
    ),
  );

  locator.registerFactory<PreferenceProvider>(PreferenceProvider.new);

  locator.registerFactory<CartProvider>(
    () => CartProvider(
      getCart: locator.get<GetCartUseCase>(),
      updateCart: locator.get<UpdateCartUseCase>(),
    ),
  );

  locator.registerFactory<UserProvider>(
    () => UserProvider(getUser: locator.get<GetUserUseCase>()),
  );
}
