// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityFeedStore on _ActivityFeedStore, Store {
  Computed<int> _$numUnreadComputed;

  @override
  int get numUnread =>
      (_$numUnreadComputed ??= Computed<int>(() => super.numUnread)).value;

  final _$_feedAtom = Atom(name: '_ActivityFeedStore._feed');

  @override
  ObservableStream<Iterable<ActivityItem>> get _feed {
    _$_feedAtom.context.enforceReadPolicy(_$_feedAtom);
    _$_feedAtom.reportObserved();
    return super._feed;
  }

  @override
  set _feed(ObservableStream<Iterable<ActivityItem>> value) {
    _$_feedAtom.context.conditionallyRunInAction(() {
      super._feed = value;
      _$_feedAtom.reportChanged();
    }, _$_feedAtom, name: '${_$_feedAtom.name}_set');
  }

  final _$_feedItemsAtom = Atom(name: '_ActivityFeedStore._feedItems');

  @override
  List<ActivityItem> get _feedItems {
    _$_feedItemsAtom.context.enforceReadPolicy(_$_feedItemsAtom);
    _$_feedItemsAtom.reportObserved();
    return super._feedItems;
  }

  @override
  set _feedItems(List<ActivityItem> value) {
    _$_feedItemsAtom.context.conditionallyRunInAction(() {
      super._feedItems = value;
      _$_feedItemsAtom.reportChanged();
    }, _$_feedItemsAtom, name: '${_$_feedItemsAtom.name}_set');
  }
}
