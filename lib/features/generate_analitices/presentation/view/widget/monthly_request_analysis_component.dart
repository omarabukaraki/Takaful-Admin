import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import '../../cubit/get_request/get_request_cubit.dart';

class MonthlyRequestAnalysisComponent extends StatefulWidget {
  const MonthlyRequestAnalysisComponent({
    super.key,
  });

  @override
  State<MonthlyRequestAnalysisComponent> createState() =>
      _MonthlyRequestAnalysisComponentState();
}

class _MonthlyRequestAnalysisComponentState
    extends State<MonthlyRequestAnalysisComponent> {
  @override
  void initState() {
    BlocProvider.of<GetRequestCubit>(context).getRequestToAnalytics();
    super.initState();
  }

  List<RequestData> requestData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRequestCubit, GetRequestState>(
      listener: (context, state) {
        if (state is GetRequestSuccess) {
          double requestNumber = 0;
          for (double dateMonth = 1; dateMonth <= 12; dateMonth++) {
            for (int i = 0; i < state.requestsList.length; i++) {
              if (dateMonth ==
                  int.parse(
                      state.requestsList[i].timeRequest.substring(5, 7))) {
                requestNumber++;
              }
            }
            requestData.add(RequestData(
                requestNumber: requestNumber, dataMonth: dateMonth));
            requestNumber = 0;
          }
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4) /
              2.2,
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Monthly Requests Analysis'),
            legend:
                const Legend(isVisible: true, position: LegendPosition.bottom),
            series: [
              SplineAreaSeries<RequestData, double>(
                  name: 'Requests',
                  color: AppColor.kPrimary,
                  dataSource: requestData.length < 12
                      ? [RequestData(requestNumber: 0, dataMonth: 1)]
                      : requestData,
                  xValueMapper: (RequestData sales, _) => sales.dataMonth,
                  yValueMapper: (RequestData sales, _) => sales.requestNumber)
            ],
            primaryXAxis: const NumericAxis(
              labelFormat: 'M  {value}',
            ),
            primaryYAxis: const NumericAxis(
              labelFormat: '{value}  R',
            ),
          ),
        );
      },
    );
  }
}

class RequestData {
  double requestNumber;
  double dataMonth;
  RequestData({required this.requestNumber, required this.dataMonth});
}
