import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:kashikari/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'かしかりメモ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: {
        '/': (_) => Splash(),
        '/list': (_) => MyList(),
      },
    );
  }
}

User? firebaseUser;
final FirebaseAuth _auth = FirebaseAuth.instance;

class Splash extends StatefulWidget {
  const Splash();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future(() {
      _getUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text('スプラッシュ画面'),
      ),
    );
  }

  Future<void> _getUser(BuildContext context) async {
    try {
      firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        await _auth.signInAnonymously();
        firebaseUser = _auth.currentUser;
      }
      Navigator.pushReplacementNamed(context, '/list');
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: 'Firebaseとの接続に失敗しました');
    }
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              print('login');
              showBasicDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(firebaseUser?.uid)
              .collection('transaction')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Text('Loading...');
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data!.docs[index]));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('新規作成ボタンを押しました');
          Navigator.push<InputForm>(
            context,
            MaterialPageRoute(
              settings: const RouteSettings(name: '/new'),
              builder: (BuildContext context) => const InputForm(null),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.android),
            title: Text(
                '【${document['borrowOrLend'] == 'lend' ? '貸' : '借'}】${document['stuff']}'),
            subtitle: Text(
                '期限: ${(document['date'] as Timestamp).toDate().toString().substring(0, 10)}\n相手: ${document['user']}'),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  print('編集ボタンを押しました');
                  Navigator.push<InputForm>(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(name: '/edit'),
                      builder: (BuildContext context) => InputForm(document),
                    ),
                  );
                },
                child: const Text('編集'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showBasicDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var email = '';
    var password = '';
    if (firebaseUser?.isAnonymous ?? true) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('ログイン/登録ダイアログ'),
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                  onSaved: (String? value) {
                    if (value != null) {
                      email = value;
                    }
                  },
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Emailは必須項目です';
                    }
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Password',
                  ),
                  onSaved: (String? value) {
                    if (value != null) {
                      password = value;
                    }
                  },
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Passwordは必須入力項目です';
                    }
                    if ((value?.length ?? 0) < 6) {
                      return 'Passwordは6桁以上です';
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              child: const Text('登録'),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  _createUser(context, email, password);
                }
              },
            ),
            TextButton(
              child: const Text('ログイン'),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  _signIn(context, email, password);
                }
              },
            ),
          ],
        ),
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('確認ダイアログ'),
          content: Text('${firebaseUser?.email ?? ''} でログインしています。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              child: const Text('ログアウト'),
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
            ),
          ],
        ),
      );
    }
  }

  Future<void> _signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: 'Firebaseのログインに失敗しました。');
    }
  }

  Future<void> _createUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: 'Firebaseの登録に失敗しました。');
    }
  }
}

class InputForm extends StatefulWidget {
  const InputForm(this.document);

  final DocumentSnapshot? document;

  @override
  _InputFormState createState() => _InputFormState();
}

class _FormData {
  String borrowOrLend = 'borrow';
  String user = '';
  String stuff = '';
  DateTime date = DateTime.now();
}

class _InputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _FormData _data = _FormData();

  void _setLendOrRent(String? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _data.borrowOrLend = value;
    });
  }

  Future<DateTime?> _selectTime(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: _data.date,
      firstDate: DateTime(_data.date.year - 2),
      lastDate: DateTime(_data.date.year + 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _mainReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .collection('transaction')
        .doc();
    var deleteFlag = false;
    if (widget.document != null) {
      _data
        ..borrowOrLend = widget.document!['borrowOrLend'] as String
        ..user = widget.document!['user'] as String
        ..stuff = widget.document!['stuff'] as String
        ..date = (widget.document!['date'] as Timestamp).toDate();
      _mainReference = FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser?.uid)
          .collection('transaction')
          .doc(widget.document!.id);
      deleteFlag = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('かしかり入力'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              print('保存ボタンを押しました');
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                _mainReference.set(
                  <String, dynamic>{
                    'borrowOrLend': _data.borrowOrLend,
                    'user': _data.user,
                    'stuff': _data.stuff,
                    'date': Timestamp.fromDate(_data.date),
                  },
                );
                Navigator.pop(context);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: !deleteFlag
                ? null
                : () {
                    print('削除ボタンを押しました');
                    _mainReference.delete();
                    Navigator.pop(context);
                  },
          ),
          IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  Share.share(
                      '【${_data.borrowOrLend == 'lend' ? '貸' : '借'}】${_data.stuff}\n期限: ${_data.date.toString().substring(0, 10)}\n相手: ${_data.user}\n#かしかりメモ');
                }
              }),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              RadioListTile(
                value: 'borrow',
                groupValue: _data.borrowOrLend,
                title: const Text('借りた'),
                onChanged: (String? value) {
                  print('借りたをタッチしました');
                  _setLendOrRent(value);
                },
              ),
              RadioListTile(
                value: 'lend',
                groupValue: _data.borrowOrLend,
                title: const Text('貸した'),
                onChanged: (String? value) {
                  print('貸したをタッチしました');
                  _setLendOrRent(value);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: '相手の名前',
                  labelText: 'Name',
                ),
                onSaved: (String? value) {
                  if (value != null) {
                    _data.user = value;
                  }
                },
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return '名前は必須入力項目です';
                  }
                },
                initialValue: _data.user,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.business_center),
                  hintText: '借りたもの、貸したもの',
                  labelText: 'loan',
                ),
                onSaved: (String? value) {
                  if (value != null) {
                    _data.stuff = value;
                  }
                },
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return '借りたもの、貸したものは必須入力項目です';
                  }
                },
                initialValue: _data.stuff,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('締め切り日: ${_data.date.toString().substring(0, 10)}'),
              ),
              ElevatedButton(
                child: const Text('締め切り日変更'),
                onPressed: () {
                  print('締め切り日変更をタッチしました');
                  _selectTime(context).then((time) {
                    if (time != null && time != _data.date) {
                      setState(() {
                        _data.date = time;
                      });
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
