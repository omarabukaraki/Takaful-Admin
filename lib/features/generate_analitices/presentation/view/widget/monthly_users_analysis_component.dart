import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';

import '../../../../ban_user/presentation/cubit/get_users_cubit.dart';

class MonthlyUsersAnalysisComponent extends StatefulWidget {
  const MonthlyUsersAnalysisComponent({
    super.key,
  });

  @override
  State<MonthlyUsersAnalysisComponent> createState() =>
      _MonthlyUsersAnalysisComponentState();
}

class _MonthlyUsersAnalysisComponentState
    extends State<MonthlyUsersAnalysisComponent> {
  @override
  void initState() {
    BlocProvider.of<GetUsersCubit>(context).getAllUsers();
    super.initState();
  }

  List<UserData> userData = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUsersCubit, GetUsersState>(
      listener: (context, state) {
        if (state is GetUsersSuccess) {
          int userNumber = 0;
          for (int dateMonth = 1; dateMonth <= 12; dateMonth++) {
            for (int i = 0; i < state.users.length; i++) {
              if (dateMonth == state.users[i].createAt) {
                userNumber++;
              }
            }
            userData.add(UserData(userNumber, dateMonth));
            userNumber = 0;
          }
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4) /
              2.2,
          child: SfCartesianChart(
            title: const ChartTitle(text: AppString.monthlyUsersAnalysis),
            legend:
                const Legend(isVisible: true, position: LegendPosition.bottom),
            series: [
              LineSeries<UserData, dynamic>(
                  name: AppString.textUsers,
                  color: AppColor.kRed,
                  dataSource:
                      userData.length < 12 ? [UserData(0, 1)] : userData,
                  xValueMapper: (UserData sales, _) => sales.dateMonth,
                  yValueMapper: (UserData sales, _) => sales.userNumber),
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

class UserData {
  int userNumber;
  int dateMonth;
  UserData(this.userNumber, this.dateMonth);
}
