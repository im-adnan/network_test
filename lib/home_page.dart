import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_test/blocs/internet_bloc/internet_bloc.dart';
import 'package:network_test/blocs/internet_bloc/internet_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Connected"),
                backgroundColor: Colors.greenAccent,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Disconnected"),
                backgroundColor: Colors.redAccent,
              ));
            }
          },
          child: Text('Internet Connectivity Test'),
        ),
      )),
    );
  }
}
