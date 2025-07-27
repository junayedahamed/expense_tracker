import 'package:expence_tracker/src/repositories/stream_view_controller/stream_view_controller.dart';
import 'package:expence_tracker/src/view/stats/widgets/daily_chart.dart';
import 'package:expence_tracker/src/view/stats/widgets/monthly_stream.dart';
import 'package:expence_tracker/src/view/stats/widgets/week_stream.dart';
import 'package:expence_tracker/src/view/stats/widgets/year_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamViewer extends StatelessWidget {
  const StreamViewer({super.key});

  @override
  Widget build(BuildContext context) {
    // final value = context.watch<StreamViewController>().selected.toLowerCase();
    return BlocBuilder<StreamViewController, String>(
      builder: (context, value) => Container(
        child: value == 'daily'
            ? DailyChart()
            : value == 'weekly'
            ? WeekStream()
            : value == 'monthly'
            ? MonthStream()
            : YearStream(),
      ),
    );

    // return Text(context.read<StreamViewController>().selected);
  }
}
