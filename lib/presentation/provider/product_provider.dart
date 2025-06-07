import 'package:flutter/foundation.dart';
import 'package:minimart/domain.dart';
import 'package:minimart/generated/l10n.dart' show S;

import 'error_handling.dart';

class ProductProvider with ChangeNotifier, ErrorHandling {
  ProductProvider({
    required FetchProductsUseCase fetchProducts,
    required FetchProductsCategoryUseCase fetchProductsCategory,
    required SearchProductsUseCase searchProducts,
    required GetProductUseCase getProduct,
    required FavouriteProductUseCase favoriteProduct,
  }) : _fetchProducts = fetchProducts,
       _fetchProductsCategory = fetchProductsCategory,
       _searchProducts = searchProducts,
       _getProduct = getProduct,
       _favoriteProduct = favoriteProduct;
  final FetchProductsUseCase _fetchProducts;
  final FetchProductsCategoryUseCase _fetchProductsCategory;
  final SearchProductsUseCase _searchProducts;
  final GetProductUseCase _getProduct;
  final FavouriteProductUseCase _favoriteProduct;

  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  Product? _selectedProduct;
  String? _currentCategory;
  bool _isLoading = false;

  List<Product> get products =>
      _filteredProducts.isNotEmpty ? _filteredProducts : _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get currentCategory => _currentCategory;

  Future<void> loadProducts() async {
    _isLoading = true;
    clearError(false);

    try {
      _products = await _fetchProducts.invoke();
      _filteredProducts = [];
      _currentCategory = null;
    } catch (e) {
      setError(S.current.failedToLoadProducts);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadProductsByCategory(String category) async {
    _isLoading = true;
    clearError();

    try {
      _filteredProducts = await _fetchProductsCategory.invoke(category);
      _currentCategory = category;
    } catch (e) {
      setError(S.current.failedToLoadCategoryProducts);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchProducts(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _filteredProducts = await _searchProducts.invoke(query);
    } catch (e) {
      setError(S.current.searchFailed);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getProductById(String id) async {
    _isLoading = true;
    clearError();

    try {
      _selectedProduct = await _getProduct.invoke(id);
    } catch (e) {
      setError(S.current.productNotFound);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Product product) {
    _favoriteProduct.invoke(product);
    notifyListeners();
  }
}
