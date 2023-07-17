// ignore_for_file: unused_field, must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:ess_mobile/themes/constant.dart';
import 'package:flutter/material.dart';

class HeaderProfileWidget extends StatelessWidget {
  final String? _userName;
  final String? _posision;
  final String? _imageUrl;
  final String? _webUrl;

  const HeaderProfileWidget({
    Key? key,
    required String? userName,
    required String? posision,
    required String? imageUrl,
    required String? webUrl,
  })  : _userName = userName,
        _posision = posision,
        _imageUrl = imageUrl,
        _webUrl = webUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName!.toUpperCase(),
                  style: const TextStyle(
                      color: Color(primaryBlack),
                      fontSize: textLarge,
                      fontFamily: 'Poppins',
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Text(
                  '$_posision',
                  style: const TextStyle(
                      color: Color(primaryBlack),
                      fontSize: 14,
                      letterSpacing: 0.9,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 33,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 30,
                backgroundImage: _imageUrl == ''
                    ? const AssetImage('assets/images/user-profile-default.png')
                        as ImageProvider
                    : NetworkImage(
                        '$_webUrl/employee-photos/$_imageUrl',
                      )),
          )
        ],
      ),
    );
  }
}
