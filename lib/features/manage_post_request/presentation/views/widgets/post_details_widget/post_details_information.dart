import 'package:flutter/material.dart';
import 'package:takaful_admin1/features/manage_post_request/data/post_model.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_info_component.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';

import '../../../../../../core/utils/app_strings.dart';

class PostDetailsInformation extends StatelessWidget {
  const PostDetailsInformation({
    super.key,
    required this.post,
  });
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              children: [
                const SizedBox(
                  height: 27,
                ),
                PostDetailsInformationComponent(
                    data: '${post.location} - ${post.subLocation}',
                    section: AppString.textLocation),
                PostDetailsInformationComponent(
                  data: post.createAt!.substring(0, 16),
                  section: AppString.textPublishDate,
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TitleDonationDetailsPage(
                      text: AppString.textInformation,
                    ),
                  ],
                ),
                PostDetailsInformationComponent(
                  data: '${post.category} , ${post.itemOrService}',
                  section: AppString.textSection,
                ),
                PostDetailsInformationComponent(
                  data: post.state,
                  section: AppString.textState,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
