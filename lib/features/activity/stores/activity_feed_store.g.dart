// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityFeedStore on _ActivityFeedStore, Store {
  final _$feedAtom = Atom(name: '_ActivityFeedStore.feed');

  @override
  ObservableStream<Iterable<ActivityItem>> get feed {
    _$feedAtom.context.enforceReadPolicy(_$feedAtom);
    _$feedAtom.reportObserved();
    return super.feed;
  }

  @override
  set feed(ObservableStream<Iterable<ActivityItem>> value) {
    _$feedAtom.context.conditionallyRunInAction(() {
      super.feed = value;
      _$feedAtom.reportChanged();
    }, _$feedAtom, name: '${_$feedAtom.name}_set');
  }
}
