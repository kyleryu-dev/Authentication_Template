import 'package:authentication_template/pages/auth_page.dart';
import 'package:authentication_template/pages/my_home.dart';
import 'package:authentication_template/pages/page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Consumer<PageNotifier>(
          builder: (context,PageNotifier,child){
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: MyHomePage(title: 'Flutter Demo Home Page')),
                if(PageNotifier.currentPage == AuthPage.pageName)
                  AuthPage(),
              ],
              onPopPage: (route, result) {
                if(!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );
          },
        ),
      ),
    );
  }
}
