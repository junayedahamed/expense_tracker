import 'package:expence_tracker/functionalities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final MyBloc bloc = MyBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBloc>(
      create: (context) => bloc,
      child: Scaffold(
        body: BlocBuilder<MyBloc, FunctionState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Count:${state.value} "),

                  Checkbox(
                    value: state.check,
                    onChanged: (value) {
                      context.read<MyBloc>().add(CheckBox());
                    },
                  ),

                  IconButton(
                    onPressed: () {
                      context.read<MyBloc>().add(Counter());
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
