import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:telegram_app/models/user.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserWidget extends StatelessWidget {
  final User? user;
  final VoidCallback? onTap;

  const UserWidget(
    this.user, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  factory UserWidget.shimmed() => UserWidget(null);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: CircleAvatar(
          child: Text(user != null ? user!.initials : 'AA'),
        ),
        title: Text(user != null ? user!.displayName : 'First name'),
        subtitle: Text(user != null && user!.lastAccess != null
            ? timeago.format(user!.lastAccess!,
                locale: AppLocalizations.of(context)?.localeName)
            : AppLocalizations.of(context)?.label_last_access ?? ''),
        onTap: onTap,
      );
}
