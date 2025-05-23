import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recognify/util/color.dart';
import 'package:recognify/view/widget/text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key, required this.isDialog});
  final bool isDialog;

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  var _contactType = ContactType.whatsapp;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        'Contact Me',
        style: TextStyle(color: CustomColor.onDialog()),
      ),

      backgroundColor: Color(0xFF333333),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomTextField(controller: subjectController, label: 'Subject'),
            Gap(12),
            CustomTextField(
              controller: messageController,
              label: 'Message',
              minLines: 5,
            ),
            Gap(12),
            RadioListTile<ContactType>(
              value: ContactType.whatsapp,
              groupValue: _contactType,
              title: Text(
                'WhatsApp',
                style: TextStyle(color: CustomColor.label()),
              ),
              onChanged:
                  (value) => setState(() {
                    if (value == null) return;
                    _contactType = value;
                  }),
            ),
            RadioListTile<ContactType>(
              title: Text(
                'Email',
                style: TextStyle(color: CustomColor.label()),
              ),
              value: ContactType.email,
              groupValue: _contactType,
              onChanged:
                  (value) => setState(() {
                    if (value == null) return;
                    _contactType = value;
                  }),
            ),
          ],
        ),
      ),
      actions: [
        if (widget.isDialog)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: TextStyle(color: CustomColor.label())),
          ),
        OutlinedButton(
          onPressed: () async {
            if (_contactType == ContactType.email) {
              final subject = Uri.encodeComponent(subjectController.text);
              final message = Uri.encodeComponent(messageController.text);
              final Uri uri = Uri.parse(
                'mailto:adiyahya454@gmail.com?subject=$subject&body=$message',
              );
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Could not launch $uri';
              }
            }
            if (_contactType == ContactType.whatsapp) {
              final phoneNumber = '+6281329615533';
              final message =
                  '${subjectController.text}\n\n${messageController.text}';
              final Uri whatsappUri = Uri.parse(
                'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
              );

              if (await canLaunchUrl(whatsappUri)) {
                await launchUrl(
                  whatsappUri,
                  mode: LaunchMode.externalApplication,
                );
              } else {
                throw 'Could not launch WhatsApp';
              }
            }
          },
          child: Text('Send', style: TextStyle(color: CustomColor.onDialog())),
        ),
      ],
    );
  }
}

enum ContactType { whatsapp, email }
