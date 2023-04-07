import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

TextStyle? kTextHeadline1({required BuildContext context}) =>
    Theme.of(context).textTheme.headlineLarge;

TextStyle? kTextHeadline2({required BuildContext context}) =>
    Theme.of(context).textTheme.headlineMedium;

TextStyle? kTextHeadline3({required BuildContext context}) =>
    Theme.of(context).textTheme.headlineSmall;

TextStyle? kTextTitleBold({required BuildContext context}) => Theme.of(context)
    .textTheme
    .titleLarge
    ?.copyWith(fontWeight: FontWeight.w600);

TextStyle? kTextTitleNormal({required BuildContext context}) =>
    Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.w400);

TextStyle? kTextDescriptionBold({required BuildContext context}) =>
    Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.w500);

TextStyle? kTextDescriptionNormal({required BuildContext context}) =>
    Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.w400);

TextStyle? kTextHelperBold1({required BuildContext context}) =>
    Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        );

TextStyle? kTextHelperNormal1({required BuildContext context}) =>
    Theme.of(context)
        .textTheme
        .titleSmall
        ?.copyWith(fontWeight: FontWeight.w400);

TextStyle? kTextHelperNormal2({required BuildContext context}) =>
    Theme.of(context)
        .textTheme
        .titleSmall
        ?.copyWith(fontWeight: FontWeight.w400);

TextStyle? kTextHelperLineThrough({required BuildContext context}) =>
    Theme.of(context).textTheme.titleSmall?.copyWith(
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.lineThrough);

InputDecoration? kInputDecorationOutline({required BuildContext context}) =>
    InputDecoration(
        labelStyle: const TextStyle()
            .copyWith(color: kOnPrimaryBlack(context: context)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kOnPrimaryContainerBlackGray(context: context),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30)),
        helperStyle: const TextStyle()
            .copyWith(color: kOnPrimaryBlack(context: context)),
        errorStyle: const TextStyle().copyWith(color: AppColors.red),
        errorBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.red)),
        focusedBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: kOnPrimaryContainerBlackGray(context: context))),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.red)),
        disabledBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: kOnPrimaryContainerBlackGray(context: context))),
        border: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kOnPrimaryBlack(context: context))));

InputDecoration? kInputDecorationUnderline({required BuildContext context}) =>
    InputDecoration(
      labelStyle: kTextDescriptionNormal(context: context)?.copyWith(
        color: kOnPrimaryContainerBlackGray(context: context),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: kPrimaryContainerWhiteGray(context: context), width: 1),
      ),
      helperStyle:
          const TextStyle().copyWith(color: kOnPrimaryBlack(context: context)),
      errorStyle: const TextStyle().copyWith(color: AppColors.red),
      errorBorder: const UnderlineInputBorder().copyWith(
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 0.5,
        ),
      ),
      focusedBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
            width: 0.5, color: kOnPrimaryContainerBlackGray(context: context)),
      ),
      focusedErrorBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: kOnPrimaryContainerBlackGray(context: context),
          width: 0.5,
        ),
      ),
      disabledBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          width: 0.5,
          color: kOnPrimaryContainerBlackGray(context: context),
        ),
      ),
      border: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(
          color: kOnPrimaryBlack(context: context),
          width: 0.5,
        ),
      ),
    );

Color kPrimaryWhite({required BuildContext context}) =>
    Theme.of(context).colorScheme.primary;

Color kPrimaryContainerWhiteGray({required BuildContext context}) =>
    Theme.of(context).colorScheme.primaryContainer;

Color kSecondaryBlack({required BuildContext context}) =>
    Theme.of(context).colorScheme.secondary;

Color kSecondaryContainerBlackGray({required BuildContext context}) =>
    Theme.of(context).colorScheme.secondaryContainer;

Color kSurfaceWhite({required BuildContext context}) =>
    Theme.of(context).colorScheme.surface;

Color kInverseSurfaceBlack({required BuildContext context}) =>
    Theme.of(context).colorScheme.inverseSurface;

Color kSurfaceVariantWhiteGray({required BuildContext context}) =>
    Theme.of(context).colorScheme.surfaceVariant;

Color kOnPrimaryBlack({required BuildContext context}) =>
    Theme.of(context).colorScheme.onPrimary;

Color kOnPrimaryContainerBlackGray({required BuildContext context}) =>
    Theme.of(context).colorScheme.onPrimaryContainer;

Color kOnSecondaryWhite({required BuildContext context}) =>
    Theme.of(context).colorScheme.onSecondary;

Color kOnSecondaryContainerWhiteGray({required BuildContext context}) =>
    Theme.of(context).colorScheme.onSecondaryContainer;

Color kOnSurfaceBlack({required BuildContext context}) =>
    Theme.of(context).colorScheme.onSurface;

Color kOnInverseSurfaceWhite({required BuildContext context}) =>
    Theme.of(context).colorScheme.onInverseSurface;

Color kOnSurfaceVariantBlackGray({required BuildContext context}) =>
    Theme.of(context).colorScheme.onSurfaceVariant;
