import 'package:flutter/material.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/post_details_info_component.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/views/widgets/post_details_widget/title_post_details_page.dart';

class PostDetailsInformation extends StatelessWidget {
  const PostDetailsInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 8,
          child: Column(
            children: [
              SizedBox(
                height: 27,
              ),
              PostDetailsInformationComponent(),
              PostDetailsInformationComponent()
            ],
          ),
        ),
        Expanded(child: SizedBox()),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TitleDonationDetailsPage(
                    text: 'المعلومات',
                  ),
                ],
              ),
              PostDetailsInformationComponent(),
              PostDetailsInformationComponent(),
            ],
          ),
        )
      ],
    );
  }
}
