import 'package:ess_mobile/themes/constant.dart';
import 'package:ess_mobile/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormAplikasiTrainingScreen extends StatefulWidget {
  const FormAplikasiTrainingScreen({super.key});

  @override
  State<FormAplikasiTrainingScreen> createState() =>
      _FormAplikasiTrainingScreenState();
}

List<String> options = ['Tinggi', 'Normal', 'Rendah'];

class _FormAplikasiTrainingScreenState
    extends State<FormAplikasiTrainingScreen> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Form Aplikasi Training',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: sizedBoxHeightExtraTall,
            ),
            const Text(
              'Prioritas',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(primaryBlack),
                  fontSize: textMedium,
                  fontFamily: 'Poppins',
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: sizedBoxHeightShort,
            ),
            Container(
              height: size.height * 0.05,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: const Text('Tinggi'),
                leading: Radio(
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text('Tinggi'),
              leading: Radio(
                value: options[0],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(
              height: sizedBoxHeightTall,
            ),
            const Text(
              'Nomor',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(primaryBlack),
                  fontSize: textMedium,
                  fontFamily: 'Poppins',
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
