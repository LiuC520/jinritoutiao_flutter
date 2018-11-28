import 'package:flutter/material.dart';
import 'routers/routers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:base_architecture/base_architecture.dart';
import 'package:jinritoutiao/localization.dart';
import 'package:jinritoutiao/reducers/app_state_reducer.dart';
import 'package:jinritoutiao/models/app_state.dart';
import 'package:jinritoutiao/middleware/store_todos_middleware.dart';
import 'package:jinritoutiao/actions/actions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreTodosMiddleware(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: ReduxLocalizations().appTitle,
        theme: ThemeData(
          primaryColor: Colors.red,
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          ReduxLocalizationsDelegate(),
        ],
        routes: getRouters(),
      ),

      // routes: {
      //   ArchSampleRoutes.home: (context) {
      //     return StoreBuilder<AppState>(
      //       onInit: (store) => store.dispatch(LoadTodosAction()),
      //       builder: (context, store) {
      //         return HomeScreen();
      //       },
      //     );
      //   },
      //   ArchSampleRoutes.addTodo: (context) {
      //     return AddTodo();
      //   },
      // },
    );
  }
}
