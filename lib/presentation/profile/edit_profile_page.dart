import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/generated/locale_keys.g.dart';
import 'package:habit_tracker/presentation/common_widgets/buttons/standart_button.dart';
import 'package:habit_tracker/presentation/common_widgets/inputs/transparent_input_field.dart';
import 'package:habit_tracker/presentation/profile/providers/edit_profile_provider.dart';
import 'package:habit_tracker/presentation/theme/app_spacing.dart';
import 'package:habit_tracker/presentation/theme/colors.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 2.5,
        shadowColor: Colors.black.withOpacity(0.25),
        automaticallyImplyLeading: true,
        title: Text(
          LocaleKeys.profile_tab.tr(),
        ),
      ),
      body: Consumer<EditProfileProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpacing.vertical24,
                GestureDetector(
                  onTap: provider.selectImage,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        height: MediaQuery.sizeOf(context).width * 0.4,
                        child: provider.selectedImage != null
                            ? Image.file(
                                File(provider.selectedImage!.path),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                provider.currentUser?.photoURL ?? '',
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).width * 0.4,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;

                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorBuilder: (context, error, trace) => ColoredBox(
                                  color: AppColors.platinum900,
                                  child: Padding(
                                    padding: const EdgeInsets.all(56.0),
                                    child: SvgPicture.asset(
                                      Assets.svg.plus.path,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                AppSpacing.vertical16,
                TransparentInputField(
                  controller: provider.nameController,
                  onChanged: provider.onNameEditingComplete,
                  label: LocaleKeys.name.tr(),
                  autofocus: false,
                  selected: false,
                  withLabel: true,
                ),
                AppSpacing.vertical16,
                TransparentInputField(
                  controller: provider.emailController,
                  onChanged: provider.onEmailEditingComplete,
                  label: LocaleKeys.email.tr(),
                  autofocus: false,
                  selected: false,
                  withLabel: true,
                ),
                const Spacer(),
                StandardButton(
                  loading: provider.loading,
                  onPressed: provider.saveChanges,
                  backgroundColor: provider.hasChanges ? AppColors.purple500 : Colors.white,
                  text: LocaleKeys.edit.tr(),
                  border: provider.hasChanges
                      ? const BorderSide(color: AppColors.purple500, width: 1)
                      : const BorderSide(color: AppColors.borderStandard, width: 1),
                  textColor: provider.hasChanges ? Colors.white : Colors.black,
                ),
                AppSpacing.vertical24,
              ],
            ),
          );
        },
      ),
    );
  }
}
