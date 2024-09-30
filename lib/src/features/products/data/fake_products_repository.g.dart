// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_products_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $productsRepositoryHash() => r'201c3eee525a7f0e114e2c35f87c15487b91626e';

/// See also [productsRepository].
final productsRepositoryProvider = AutoDisposeProvider<FakeProductsRepository>(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $productsRepositoryHash,
);
typedef ProductsRepositoryRef = AutoDisposeProviderRef<FakeProductsRepository>;
String $productsListFutureHash() => r'8f018bf574c889710ce2ba492782d7bb421cfbed';

/// See also [productsListFuture].
final productsListFutureProvider = AutoDisposeFutureProvider<List<Product>>(
  productsListFuture,
  name: r'productsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $productsListFutureHash,
);
typedef ProductsListFutureRef = AutoDisposeFutureProviderRef<List<Product>>;
