import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterproject/blocs/blocs.dart';
import 'package:flutterproject/screens/screens.dart';

class LoadingScreen extends StatelessWidget {
   
   const LoadingScreen({Key? key}) : super(key: key);
   
   @override
   Widget build(BuildContext context) {
   return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
            ? const MapScreen()
            : const GpsAccessScreen();
        },
      )
   );
   }
}