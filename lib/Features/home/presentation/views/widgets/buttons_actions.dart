import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsActions extends StatelessWidget {
  const ButtonsActions({
    super.key,
    required this.books,
  });
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              backGroundcolor: Colors.white,
              text: 'For Free',
              textcolor: Colors.black,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              // onPressed: () {},
              onPressed: () async {
                final Uri _url = Uri.parse(books.volumeInfo!.previewLink!);

                if (await canLaunchUrl(_url)) {
                  await launchUrl(_url);
                }
              },
              backGroundcolor: Color(0xffEf8262),
              text: 'Free Preview',
              fontSize: 16,
              textcolor: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}
