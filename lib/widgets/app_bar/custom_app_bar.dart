import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
  });

  final List<Widget>? actions;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: title != null ? Text(title!) : null,
      centerTitle: true,
      actions: [
        if (actions != null) ...actions!,
        const Gap(8.0),
      ],
    );
  }
}
