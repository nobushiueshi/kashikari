// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Registration_borrow": MessageLookupByLibrary.simpleMessage("Borrow"),
        "Registration_lend": MessageLookupByLibrary.simpleMessage("Lend"),
        "Registration_loan_borrow":
            MessageLookupByLibrary.simpleMessage("Things I borrow"),
        "Registration_loan_lend":
            MessageLookupByLibrary.simpleMessage("Things I lend"),
        "Registration_name_borrow":
            MessageLookupByLibrary.simpleMessage("FROM WHOM"),
        "Registration_name_lend":
            MessageLookupByLibrary.simpleMessage("TO WHOM"),
        "borrow": MessageLookupByLibrary.simpleMessage("BORROW"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "change_deadline":
            MessageLookupByLibrary.simpleMessage("Change Deadline"),
        "deadline": MessageLookupByLibrary.simpleMessage("Deadline:\$time"),
        "dialog": MessageLookupByLibrary.simpleMessage("User Info"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "fail_connect_firebase": MessageLookupByLibrary.simpleMessage(
            "Failed to connect to Firebase"),
        "fail_login_firebase":
            MessageLookupByLibrary.simpleMessage("Failed to login to Firebase"),
        "fail_register_firebase": MessageLookupByLibrary.simpleMessage(
            "Failed to register to Firebase"),
        "input_title": MessageLookupByLibrary.simpleMessage("Registration"),
        "lend": MessageLookupByLibrary.simpleMessage("LEND"),
        "list_null_data": MessageLookupByLibrary.simpleMessage(
            "Let`s tap the add button to take a note of your lending and borrowing!"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_register":
            MessageLookupByLibrary.simpleMessage("Login/Register"),
        "login_user":
            MessageLookupByLibrary.simpleMessage("Login User : \$mail"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "title": MessageLookupByLibrary.simpleMessage("Kasikari-memo"),
        "validate_loan":
            MessageLookupByLibrary.simpleMessage("Please enter your loan"),
        "validate_mail":
            MessageLookupByLibrary.simpleMessage("Please enter your email"),
        "validate_name":
            MessageLookupByLibrary.simpleMessage("Please enter your name"),
        "validate_password_null_empty":
            MessageLookupByLibrary.simpleMessage("Please enter password"),
        "validate_password_short_length":
            MessageLookupByLibrary.simpleMessage("More than 6 characters"),
        "who": MessageLookupByLibrary.simpleMessage("Who:\$name")
      };
}
