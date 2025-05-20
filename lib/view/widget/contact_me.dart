import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recognify/util/color.dart';
import 'package:recognify/view/widget/text_field.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

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
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    _contactType = value!;
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
                    _contactType = value!;
                  }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel', style: TextStyle(color: CustomColor.label())),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Send', style: TextStyle(color: CustomColor.onDialog())),
        ),
      ],
    );
  }
}

enum ContactType { whatsapp, email }
