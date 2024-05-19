import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:movies_app/ui/components/login/login_button.dart';
import 'package:movies_app/ui/components/login/text_field.dart';
import 'package:movies_app/ui/pages/main_page.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/widgets/sizedbox_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.state});

  final LoginPageState? state;
  static final usernameController = TextEditingController();
  static final passwordController = TextEditingController();

  Widget myFunc({String? response}) {
    if (response == 'Ошибка авторизации!') {
      return Text(
        response!,
        style: const TextStyle(fontSize: 32, color: Colors.red),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildWidget(BuildContext context, {String? response}) {
    final linkSingUp = Api.linkSingUp;
    final mQ = MediaQuery.of(context).size;
    return Container(
      color: AppColors.darkBlueColor,
      width: mQ.width,
      height: mQ.height,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBoxHeightWidget(
              height: 80,
            ),
            Align(alignment: Alignment.centerLeft,
              child: Text(
                ' Вход в аккаунт',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: mQ.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    myFunc(),
                    MyTextFieldWidget(
                      hintText: 'Логин',
                      labelText: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBoxHeightWidget(height: 10),
                    MyTextFieldWidget(
                      hintText: 'Пароль',
                      labelText: 'Password',
                      controller: passwordController,
                      obsecureText: true,
                    ),
                    const SizedBoxHeightWidget(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '\t\tПредварительно зарегистрируйтесь на сайте',
                        style: TextStyle(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBoxHeightWidget(height: 20),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: LoginButton(
                    text: 'Авторизоваться',
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                        LoginPageEvent(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBoxHeightWidget(height: 500),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () async {
                      launchUrl(linkSingUp);
                    },
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: AppColors.lightBgColor,
                    minWidth: mQ.width / 1.2,
                    child: Text(
                      'Cоздать аккаунт',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: BlocBuilder<AuthenticationBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return buildWidget(context);
            }
            if (state is SuccessState) {
              return const MainPage();
            }
            if (state is FailureState) {
              return const Center(
                child: Text(
                  'Ошибка авторизации',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.redColor,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
