import 'package:auto_route/annotations.dart';
import 'package:book_ai/presentation/pages/ai_generate/widgets/ai_generate_form.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AiGenerateScreen extends StatelessWidget {
  const AiGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 95.h),
          const Heading(content: 'AI Generate'),
          SizedBox(height: 2.h),
          const Subheading(
            content: 'Generate your own custom story',
          ),
          SizedBox(height: 10.h),
          Text(
            'To add multiple values in a parameter, separate each with a comma',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 15.h),
          const AiGenerateForm(),
        ]),
      ),
    );
  }
}