// Mocks generated by Mockito 5.3.0 from annotations
// in coolmovies/test/repositories/user/concrete_user_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:coolmovies/core/core.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:graphql/src/cache/cache.dart' as _i3;
import 'package:graphql/src/core/core.dart' as _i2;
import 'package:graphql/src/graphql_client.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDefaultPolicies_0 extends _i1.SmartFake
    implements _i2.DefaultPolicies {
  _FakeDefaultPolicies_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeLink_1 extends _i1.SmartFake implements _i2.Link {
  _FakeLink_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeGraphQLCache_2 extends _i1.SmartFake implements _i3.GraphQLCache {
  _FakeGraphQLCache_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQueryManager_3 extends _i1.SmartFake implements _i2.QueryManager {
  _FakeQueryManager_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeGraphQLClient_4 extends _i1.SmartFake implements _i4.GraphQLClient {
  _FakeGraphQLClient_4(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeObservableQuery_5<TParsed> extends _i1.SmartFake
    implements _i2.ObservableQuery<TParsed> {
  _FakeObservableQuery_5(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQueryResult_6<TParsed extends Object?> extends _i1.SmartFake
    implements _i2.QueryResult<TParsed> {
  _FakeQueryResult_6(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeFlutterSecureStorage_7 extends _i1.SmartFake
    implements _i5.FlutterSecureStorage {
  _FakeFlutterSecureStorage_7(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [GraphQLClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockGraphQLClient extends _i1.Mock implements _i4.GraphQLClient {
  MockGraphQLClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DefaultPolicies get defaultPolicies => (super.noSuchMethod(
          Invocation.getter(#defaultPolicies),
          returnValue:
              _FakeDefaultPolicies_0(this, Invocation.getter(#defaultPolicies)))
      as _i2.DefaultPolicies);
  @override
  set defaultPolicies(_i2.DefaultPolicies? _defaultPolicies) =>
      super.noSuchMethod(Invocation.setter(#defaultPolicies, _defaultPolicies),
          returnValueForMissingStub: null);
  @override
  _i2.Link get link => (super.noSuchMethod(Invocation.getter(#link),
      returnValue: _FakeLink_1(this, Invocation.getter(#link))) as _i2.Link);
  @override
  _i3.GraphQLCache get cache => (super.noSuchMethod(Invocation.getter(#cache),
          returnValue: _FakeGraphQLCache_2(this, Invocation.getter(#cache)))
      as _i3.GraphQLCache);
  @override
  _i2.QueryManager get queryManager =>
      (super.noSuchMethod(Invocation.getter(#queryManager),
              returnValue:
                  _FakeQueryManager_3(this, Invocation.getter(#queryManager)))
          as _i2.QueryManager);
  @override
  set queryManager(_i2.QueryManager? _queryManager) =>
      super.noSuchMethod(Invocation.setter(#queryManager, _queryManager),
          returnValueForMissingStub: null);
  @override
  _i4.GraphQLClient copyWith(
          {_i2.Link? link,
          _i3.GraphQLCache? cache,
          _i2.DefaultPolicies? defaultPolicies,
          bool? alwaysRebroadcast}) =>
      (super.noSuchMethod(
          Invocation.method(#copyWith, [], {
            #link: link,
            #cache: cache,
            #defaultPolicies: defaultPolicies,
            #alwaysRebroadcast: alwaysRebroadcast
          }),
          returnValue: _FakeGraphQLClient_4(
              this,
              Invocation.method(#copyWith, [], {
                #link: link,
                #cache: cache,
                #defaultPolicies: defaultPolicies,
                #alwaysRebroadcast: alwaysRebroadcast
              }))) as _i4.GraphQLClient);
  @override
  _i2.ObservableQuery<TParsed> watchQuery<TParsed>(
          _i2.WatchQueryOptions<TParsed>? options) =>
      (super.noSuchMethod(Invocation.method(#watchQuery, [options]),
              returnValue: _FakeObservableQuery_5<TParsed>(
                  this, Invocation.method(#watchQuery, [options])))
          as _i2.ObservableQuery<TParsed>);
  @override
  _i2.ObservableQuery<TParsed> watchMutation<TParsed>(
          _i2.WatchQueryOptions<TParsed>? options) =>
      (super.noSuchMethod(Invocation.method(#watchMutation, [options]),
              returnValue: _FakeObservableQuery_5<TParsed>(
                  this, Invocation.method(#watchMutation, [options])))
          as _i2.ObservableQuery<TParsed>);
  @override
  _i6.Future<_i2.QueryResult<TParsed>> query<TParsed>(
          _i2.QueryOptions<TParsed>? options) =>
      (super.noSuchMethod(Invocation.method(#query, [options]),
              returnValue: _i6.Future<_i2.QueryResult<TParsed>>.value(
                  _FakeQueryResult_6<TParsed>(
                      this, Invocation.method(#query, [options]))))
          as _i6.Future<_i2.QueryResult<TParsed>>);
  @override
  _i6.Future<_i2.QueryResult<TParsed>> mutate<TParsed>(
          _i2.MutationOptions<TParsed>? options) =>
      (super.noSuchMethod(Invocation.method(#mutate, [options]),
              returnValue: _i6.Future<_i2.QueryResult<TParsed>>.value(
                  _FakeQueryResult_6<TParsed>(
                      this, Invocation.method(#mutate, [options]))))
          as _i6.Future<_i2.QueryResult<TParsed>>);
  @override
  _i6.Stream<_i2.QueryResult<TParsed>> subscribe<TParsed>(
          _i2.SubscriptionOptions<TParsed>? options) =>
      (super.noSuchMethod(Invocation.method(#subscribe, [options]),
              returnValue: _i6.Stream<_i2.QueryResult<TParsed>>.empty())
          as _i6.Stream<_i2.QueryResult<TParsed>>);
  @override
  _i6.Future<_i2.QueryResult<TParsed>> fetchMore<TParsed>(
          _i2.FetchMoreOptions? fetchMoreOptions,
          {_i2.QueryOptions<TParsed>? originalOptions,
          _i2.QueryResult<TParsed>? previousResult}) =>
      (super.noSuchMethod(
              Invocation.method(#fetchMore, [
                fetchMoreOptions
              ], {
                #originalOptions: originalOptions,
                #previousResult: previousResult
              }),
              returnValue: _i6.Future<_i2.QueryResult<TParsed>>.value(
                  _FakeQueryResult_6<TParsed>(this, Invocation.method(#fetchMore, [fetchMoreOptions], {#originalOptions: originalOptions, #previousResult: previousResult}))))
          as _i6.Future<_i2.QueryResult<TParsed>>);
  @override
  Map<String, dynamic>? readQuery(_i2.Request? request,
          {bool? optimistic = true}) =>
      (super.noSuchMethod(Invocation.method(
              #readQuery, [request], {#optimistic: optimistic}))
          as Map<String, dynamic>?);
  @override
  Map<String, dynamic>? readFragment(_i3.FragmentRequest? fragmentRequest,
          {bool? optimistic = true}) =>
      (super.noSuchMethod(Invocation.method(
              #readFragment, [fragmentRequest], {#optimistic: optimistic}))
          as Map<String, dynamic>?);
  @override
  void writeQuery(_i2.Request? request,
          {Map<String, dynamic>? data, bool? broadcast = true}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeQuery, [request], {#data: data, #broadcast: broadcast}),
          returnValueForMissingStub: null);
  @override
  void writeFragment(_i3.FragmentRequest? fragmentRequest,
          {bool? broadcast = true, Map<String, dynamic>? data}) =>
      super.noSuchMethod(
          Invocation.method(#writeFragment, [fragmentRequest],
              {#broadcast: broadcast, #data: data}),
          returnValueForMissingStub: null);
  @override
  _i6.Future<List<_i2.QueryResult<Object?>?>>? resetStore(
          {bool? refetchQueries = true}) =>
      (super.noSuchMethod(Invocation.method(
              #resetStore, [], {#refetchQueries: refetchQueries}))
          as _i6.Future<List<_i2.QueryResult<Object?>?>>?);
}

/// A class which mocks [AdaptedFlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdaptedFlutterSecureStorage extends _i1.Mock
    implements _i7.AdaptedFlutterSecureStorage {
  MockAdaptedFlutterSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.FlutterSecureStorage get storage => (super.noSuchMethod(
          Invocation.getter(#storage),
          returnValue:
              _FakeFlutterSecureStorage_7(this, Invocation.getter(#storage)))
      as _i5.FlutterSecureStorage);
  @override
  _i6.Future<Map<String, dynamic>> read(String? key) =>
      (super.noSuchMethod(Invocation.method(#read, [key]),
              returnValue:
                  _i6.Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i6.Future<Map<String, dynamic>>);
  @override
  _i6.Future<dynamic> write(String? key, dynamic value) =>
      (super.noSuchMethod(Invocation.method(#write, [key, value]),
          returnValue: _i6.Future<dynamic>.value()) as _i6.Future<dynamic>);
}
