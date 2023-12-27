import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';

import '../../../../manage_post_request/presentation/cubits/get_post_cubit/get_post_cubit.dart';
import '../../../../manage_post_request/presentation/cubits/get_post_cubit/get_post_state.dart';

class MonthlyPostAnalysisComponent extends StatefulWidget {
  const MonthlyPostAnalysisComponent({
    super.key,
  });

  @override
  State<MonthlyPostAnalysisComponent> createState() =>
      _MonthlyPostAnalysisComponentState();
}

class _MonthlyPostAnalysisComponentState
    extends State<MonthlyPostAnalysisComponent> {
  @override
  void initState() {
    BlocProvider.of<GetPostCubit>(context).getPostToDeletePost();
    super.initState();
  }

  List<DonationData> donationData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPostCubit, GetPostState>(
      listener: (context, state) {
        if (state is GetPostSuccessState) {
          int donationNumber = 0;
          for (double dateMonth = 1; dateMonth <= 12; dateMonth++) {
            for (int i = 0; i < state.posts.length; i++) {
              if (dateMonth ==
                  int.parse(state.posts[i].createAt!.substring(5, 7))) {
                donationNumber++;
              }
            }
            donationData.add(DonationData(donationNumber, dateMonth));
            donationNumber = 0;
          }
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4) /
              1.08,
          child: SfCartesianChart(
            title: const ChartTitle(text: AppString.monthlyPostsAnalysis),
            legend:
                const Legend(isVisible: true, position: LegendPosition.bottom),
            series: [
              BarSeries<DonationData, double>(
                  name: AppString.textPosts,
                  color: const Color.fromARGB(255, 0, 135, 245),
                  dataSource: donationData.length < 12
                      ? [DonationData(0, 1)]
                      : donationData,
                  xValueMapper: (DonationData sales, _) => sales.dateMonth,
                  yValueMapper: (DonationData sales, _) => sales.donationCount)
            ],
            primaryXAxis: const NumericAxis(
              labelFormat: '${AppString.textMonth}  {value}',
            ),
            primaryYAxis: const NumericAxis(
              labelFormat: '{value}',
            ),
          ),
        );
      },
    );
  }
}

class DonationData {
  int donationCount;
  double dateMonth;
  DonationData(this.donationCount, this.dateMonth);
}
