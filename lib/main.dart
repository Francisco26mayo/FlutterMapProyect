import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/blocs/blocs.dart';

import 'package:flutterproject/screens/screens.dart';
import 'package:flutterproject/services/services.dart';

void main() {
  runApp( 
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc() ),
        BlocProvider(create: (context) => LocationBloc() ),
        BlocProvider(create: (context) => MapBloc( locationBloc: BlocProvider.of<LocationBloc>(context) ) ),
        BlocProvider(create: (context) => SearchBloc( trafficService: TrafficService() ))
      ],
      child: const MapsApp(),
    )
  );
}

class MapsApp extends StatelessWidget {
  
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapsApp',
      home: LoadingScreen(),
      // home: TestMarkerScreen(),
      routes: {},
    );
  }
}