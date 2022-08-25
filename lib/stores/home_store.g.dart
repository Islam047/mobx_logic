// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$itemsAtom = Atom(name: '_HomeStore.items', context: context);

  @override
  List<Post> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Post> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$myItemsAtom = Atom(name: '_HomeStore.myItems', context: context);

  @override
  List<Post> get myItems {
    _$myItemsAtom.reportRead();
    return super.myItems;
  }

  @override
  set myItems(List<Post> value) {
    _$myItemsAtom.reportWrite(value, super.myItems, () {
      super.myItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
items: ${items},
myItems: ${myItems},
isLoading: ${isLoading}
    ''';
  }
}
