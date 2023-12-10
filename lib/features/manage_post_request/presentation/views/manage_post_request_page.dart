import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_search_bar.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/post_details_page.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_widget/post_component.dart';

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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return DonationComponent(onTapRequest: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return const PostPage();

                        // }));
                        showDialog(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) => Row(
                            children: [
                              Container(
                                color: Colors.amber,
                                width: MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).size.width / 4,
                                child: const PostPage(),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            )));
  }
}
