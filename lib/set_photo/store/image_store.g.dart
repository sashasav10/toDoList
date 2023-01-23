// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageStore on _ImageStore, Store {
  late final _$_imagesAtom =
      Atom(name: '_ImageStore._images', context: context);

  @override
  ImageResult? get _images {
    _$_imagesAtom.reportRead();
    return super._images;
  }

  @override
  set _images(ImageResult? value) {
    _$_imagesAtom.reportWrite(value, super._images, () {
      super._images = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ImageStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
