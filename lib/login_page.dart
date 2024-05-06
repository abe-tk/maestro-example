import 'package:app/app_circle_loading.dart';
import 'package:app/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _unfocusKeyboard() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ユーザ名入力欄
              TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(
                  labelText: 'UserName',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 36),

              // パスワード入力欄
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 36),

              // ログインボタン
              ElevatedButton(
                onPressed: () async {
                  // キーボードを閉じる
                  _unfocusKeyboard();

                  if (_formKey.currentState!.validate()) {
                    // ローディングダイアログを表示
                    AppCircleLoadingDialog.show(context: context);

                    // 非同期処理で3秒待つ
                    await Future.delayed(const Duration(seconds: 3));

                    if (context.mounted) {
                      // ローディングダイアログを閉じる
                      Navigator.of(context).pop();

                      // ホーム画面に遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );

                      // 入力欄をクリア
                      userNameController.clear();
                      passwordController.clear();
                    }
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
