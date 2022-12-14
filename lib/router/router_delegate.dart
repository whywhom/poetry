import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poetry/router/pages.dart';

class PoetryRouteDelegate extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  final _stack = <String>[];

  static PoetryRouteDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is PoetryRouteDelegate, 'Delegate type must match');
    return delegate as PoetryRouteDelegate;
  }

  PoetryRouteDelegate({
    required this.onGenerateRoute,
  });

  final RouteFactory onGenerateRoute;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  String? get currentConfiguration => _stack.isNotEmpty ? _stack.last : null;

  List<String> get stack => List.unmodifiable(_stack);

  void push(String newRoute) {
    _stack.add(newRoute);
    notifyListeners();
  }

  void remove(String routeName) {
    _stack.remove(routeName);
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(String configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (_stack.isNotEmpty) {
      if (_stack.last == route.settings.name) {
        _stack.remove(route.settings.name);
        notifyListeners();
      }
    }
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('${describeIdentity(this)}.stack: $_stack');
    }
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: [
        for (final name in _stack)
          PoetryPage(
            key: ValueKey(name),
            name: name,
          ),
      ],
    );
  }
}
