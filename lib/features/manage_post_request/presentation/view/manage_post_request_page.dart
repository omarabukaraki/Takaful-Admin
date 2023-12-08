import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/view/widgets/donation_widget/donation_component.dart';

class ManagePostReqPage extends StatelessWidget {
  const ManagePostReqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const CustomSearchBar(
                hintText: AppString.textSearchInPosts,
                icon: Icon(Icons.search)),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const DonationComponent();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
