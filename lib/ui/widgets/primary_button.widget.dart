import 'package:flutter/material.dart';
import 'package:prueba_tecnica_doublevpartners/ui/utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;
  const PrimaryButton({ super.key, required this.text, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(12.0)),
          foregroundColor: WidgetStateProperty.all<Color>(AppColors.whiteColor),
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryButtonColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: AppColors.primaryColor)
            )
          )
        ),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor)),
      ),
    );
  }
}