// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:takaful_admin1/core/utils/app_strings.dart';
// import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
// import 'package:takaful_admin1/features/ban_user/presentation/cubit/get_users_cubit.dart';
// import 'package:takaful_admin1/features/ban_user/presentation/view/widgets/user_widget/user_component.dart';

// import '../../data/user_model.dart';

// class BanUserPage extends StatefulWidget {
//   const BanUserPage({super.key});

//   @override
//   State<BanUserPage> createState() => _BanUserPageState();
// }

// class _BanUserPageState extends State<BanUserPage> {
//   // @override
//   // void initState() {
//   //   BlocProvider.of<GetUsersCubit>(context).getAllUsers();
//   //   super.initState();
//   // }

//   List<UserModel> users = [];
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<GetUsersCubit, GetUsersState>(
//         listener: (context, state) {
//           if (state is GetUsersSuccess) {
//             users = state.users;
//             isLoading = false;
//           } else if (state is GetUsersLoading) {
//             isLoading = true;
//           } else if (state is GetUsersFailure) {
//             isLoading = false;
//           }
//         },
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               children: [
//                 CustomSearchBar(
//                   hintText: AppString.textSearchInUsers,
//                   icon: const Icon(Icons.search),
//                   onChanged: (searchValue) {
//                     BlocProvider.of<GetUsersCubit>(context)
//                         .getUsersBySearch(searchValue: searchValue);
//                   },
//                 ),
//                 Expanded(
//                   child: isLoading != true
//                       ? GridView.builder(
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 2,
//                           ),
//                           itemCount: users.length,
//                           itemBuilder: (context, index) {
//                             return UserComponent(
//                               user: users[index],
//                             );
//                           },
//                         )
//                       : const Center(child: CircularProgressIndicator()),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
