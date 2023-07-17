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

class _FormAplikasiTrainingScreenState
    extends State<FormAplikasiTrainingScreen> {
  bool? isCheckedTinggi = false;
  bool? isCheckedNormal = false;
  bool? isCheckedRendah = false;

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: isCheckedTinggi,
                        onChanged: (newBoolTinggi) {
                          setState(() {
                            isCheckedTinggi = newBoolTinggi;
                          });
                        }),
                    const Text(
                      'Tinggi',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(primaryBlack),
                          fontSize: textSmall,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isCheckedNormal,
                        onChanged: (newBoolNormal) {
                          setState(() {
                            isCheckedNormal = newBoolNormal;
                          });
                        }),
                    const Text(
                      'Normal',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(primaryBlack),
                          fontSize: textSmall,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isCheckedRendah,
                        onChanged: (newBoolRendah) {
                          setState(() {
                            isCheckedRendah = newBoolRendah;
                          });
                        }),
                    const Text(
                      'Rendah',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(primaryBlack),
                          fontSize: textSmall,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.9,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
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
