import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:telegram_app/models/chat.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatWidget extends StatelessWidget {
  final Chat? chat;
  final VoidCallback? onTap;

  const ChatWidget(this.chat, {Key? key, this.onTap}) : super(key: key);

  factory ChatWidget.shimmed() => ChatWidget(null);

  @override
  Widget build(BuildContext context) => ListTile(
        dense: true,
        leading: CircleAvatar(
          child: Text(chat != null ? chat!.initials : 'AA'),
        ),
        title: Row(
          children: [
            _title(),
            _dateTime(context),
          ],
        ),
        subtitle: _lastMessage(),
        onTap: onTap,
      );

  Widget _title() =>
      Expanded(child: Text(chat != null ? chat!.displayName : 'First name'));

  Widget _dateTime(BuildContext context) => Text(
        chat != null
            ? timeago.format(
                chat!.updatedAt ?? chat!.createdAt,
                locale: AppLocalizations.of(context)?.localeName,
              )
            : '00:00',
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  Widget _lastMessage() =>
      Text(chat != null ? chat!.lastMessage : 'Last message');
}
