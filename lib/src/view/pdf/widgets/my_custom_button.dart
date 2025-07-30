import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DownloadUploadButton extends StatelessWidget {
  const DownloadUploadButton({
    super.key,
    required this.buttonName,
    this.iconpath,
    required this.onPressed,
    this.iccolor,
    this.textcolor,
  });
  final String buttonName;
  final String? iconpath;
  final VoidCallback onPressed;
  final Color? iccolor;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 30,
          maxWidth: 110,
          minHeight: 25,
          minWidth: 90,
        ),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue.shade600,
              Colors.blue.shade500,
              Colors.blue.shade400,
              Colors.blue.shade400,
              Colors.blue.shade400,
              Colors.blue.shade300,
              Colors.blue.shade300,
              Colors.blue.shade300,
            ],
          ),
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                buttonName,
                style: TextStyle(fontWeight: FontWeight.w700, color: textcolor),
              ),
              iconpath != null
                  ? SvgPicture.asset(
                      iconpath ?? '',
                      colorFilter: ColorFilter.mode(
                        iccolor ??
                            Theme.of(context).iconTheme.color ??
                            Colors.white,
                        BlendMode.srcIn,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
