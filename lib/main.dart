import 'package:flutter/material.dart';

import 'helper/app_router.dart';

class TheGoodmanArchive extends StatelessWidget {
  final AppRouter appRouter;
  const TheGoodmanArchive({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TheGoodmanArchive',
      onGenerateRoute: appRouter.generaterout,
    );
  }
}

void main() {
  runApp( TheGoodmanArchive(appRouter: AppRouter(),));
}