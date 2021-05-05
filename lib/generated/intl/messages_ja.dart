// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Registration_borrow": MessageLookupByLibrary.simpleMessage("借りた"),
        "Registration_lend": MessageLookupByLibrary.simpleMessage("貸した"),
        "Registration_loan_borrow":
            MessageLookupByLibrary.simpleMessage("借りたもの"),
        "Registration_loan_lend": MessageLookupByLibrary.simpleMessage("貸したもの"),
        "Registration_name_borrow":
            MessageLookupByLibrary.simpleMessage("借りた相手"),
        "Registration_name_lend": MessageLookupByLibrary.simpleMessage("貸した相手"),
        "borrow": MessageLookupByLibrary.simpleMessage("借"),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "change_deadline": MessageLookupByLibrary.simpleMessage("締め切り日変更"),
        "deadline": MessageLookupByLibrary.simpleMessage("締切日:\$time"),
        "dialog": MessageLookupByLibrary.simpleMessage("ユーザ情報"),
        "edit": MessageLookupByLibrary.simpleMessage("編集"),
        "fail_connect_firebase":
            MessageLookupByLibrary.simpleMessage("Firebaseとの接続に失敗しました。"),
        "fail_login_firebase":
            MessageLookupByLibrary.simpleMessage("Firebaseへのログインに失敗しました。"),
        "fail_register_firebase":
            MessageLookupByLibrary.simpleMessage("Firebaseへの登録に失敗しました。"),
        "input_title": MessageLookupByLibrary.simpleMessage("貸し借り入力"),
        "lend": MessageLookupByLibrary.simpleMessage("貸"),
        "list_null_data":
            MessageLookupByLibrary.simpleMessage("「＋」から貸し借りをメモしてみましょう！↓"),
        "login": MessageLookupByLibrary.simpleMessage("ログイン"),
        "login_register": MessageLookupByLibrary.simpleMessage("ログイン/登録ダイアログ"),
        "login_user": MessageLookupByLibrary.simpleMessage("ログイン名 : \$mail"),
        "register": MessageLookupByLibrary.simpleMessage("登録"),
        "title": MessageLookupByLibrary.simpleMessage("かしかりメモ"),
        "validate_loan":
            MessageLookupByLibrary.simpleMessage("借りたもの、貸したものは必須入力項目です"),
        "validate_mail": MessageLookupByLibrary.simpleMessage("Emailは必須入力項目です"),
        "validate_name": MessageLookupByLibrary.simpleMessage("名前の入力は必須です。"),
        "validate_password_null_empty":
            MessageLookupByLibrary.simpleMessage("パスワードは必須入力項目です"),
        "validate_password_short_length":
            MessageLookupByLibrary.simpleMessage("パスワードは6文字以上です"),
        "who": MessageLookupByLibrary.simpleMessage("相手:\$name")
      };
}
