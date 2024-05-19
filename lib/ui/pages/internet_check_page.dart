import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/routes/app_routes.dart';

class InternetCheckPage extends StatelessWidget {
  final Connectivity _connectivity = Connectivity();

  InternetCheckPage({super.key});

  Future<void> _checkConnectivityOnce(BuildContext context) async {
    ConnectivityResult connectivityResult = await _connectivity.checkConnectivity();
    // ignore: use_build_context_synchronously
    _handleConnectivityResult(context, connectivityResult);
  }

  void _handleConnectivityResult(BuildContext context, ConnectivityResult connectivityResult) {
    final goRouter = GoRouter.of(context);

    if (connectivityResult == ConnectivityResult.none) {
      goRouter.go(RouteNames.internetCheck);
    } else {
      goRouter.go(RouteNames.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkConnectivityOnce(context); 
    return const SizedBox.shrink(); 
  }
}