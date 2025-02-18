part of 'chat_bot_view.dart';

abstract class ChatBotBubbleDecoration {
  EdgeInsets get padding;

  EdgeInsets get botMargin;

  EdgeInsets get userMargin;

  BoxDecoration get userDecoration;

  BoxDecoration get botDecoration;

  TextStyle get userTextStyle;

  TextStyle get botTextStyle;

  TextStyle get botTitleTextStyle;

  double get maxWidth;

  double get minWidth;
}
