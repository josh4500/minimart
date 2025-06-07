// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Favourite`
  String get favourite {
    return Intl.message('Favourite', name: 'favourite', desc: '', args: []);
  }

  /// `Failed to load cart`
  String get failedToLoadCart {
    return Intl.message(
      'Failed to load cart',
      name: 'failedToLoadCart',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update cart`
  String get failedToUpdateCart {
    return Intl.message(
      'Failed to update cart',
      name: 'failedToUpdateCart',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load products`
  String get failedToLoadProducts {
    return Intl.message(
      'Failed to load products',
      name: 'failedToLoadProducts',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load category products`
  String get failedToLoadCategoryProducts {
    return Intl.message(
      'Failed to load category products',
      name: 'failedToLoadCategoryProducts',
      desc: '',
      args: [],
    );
  }

  /// `Search failed`
  String get searchFailed {
    return Intl.message(
      'Search failed',
      name: 'searchFailed',
      desc: '',
      args: [],
    );
  }

  /// `Product not found`
  String get productNotFound {
    return Intl.message(
      'Product not found',
      name: 'productNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load user data`
  String get failedToLoadUserData {
    return Intl.message(
      'Failed to load user data',
      name: 'failedToLoadUserData',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update address`
  String get failedToUpdateAddress {
    return Intl.message(
      'Failed to update address',
      name: 'failedToUpdateAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `en_US`
  String get locale {
    return Intl.message('en_US', name: 'locale', desc: '', args: []);
  }

  /// `$`
  String get currencySymbol {
    return Intl.message('\$', name: 'currencySymbol', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Failed to load image`
  String get failedToLoadImage {
    return Intl.message(
      'Failed to load image',
      name: 'failedToLoadImage',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message('Add to cart', name: 'addToCart', desc: '', args: []);
  }

  /// `In stock`
  String get inStock {
    return Intl.message('In stock', name: 'inStock', desc: '', args: []);
  }

  /// `Your Cart`
  String get yourCart {
    return Intl.message('Your Cart', name: 'yourCart', desc: '', args: []);
  }

  /// `Out of stock`
  String get outOfStock {
    return Intl.message('Out of stock', name: 'outOfStock', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Order Info`
  String get orderInfo {
    return Intl.message('Order Info', name: 'orderInfo', desc: '', args: []);
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `No product in cart`
  String get noProductInCart {
    return Intl.message(
      'No product in cart',
      name: 'noProductInCart',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message('Search...', name: 'search', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
