class OnboardingStrings {
  OnboardingStrings._();
  static const String titleOneString = 'Welcome to Mova';
  static const String titleTwoString = 'Stream anytime, anywhere';
  static const String titleThreeString = 'Download to your device';
  static const String textOneString =
      'The best streaming app of the century to make your days great';
  static const String textTwoString =
      'With our curated library, watch your favorite movies and series anytime you want';
  static const String textThreeString =
      'Download your favorite movies directly to your mobile devices, to continue watching without data';
  static const String buttonOneString = 'Next';
  static const String buttonTwoString = 'Next';
  static const String buttonThreeString = 'Get Started';
}

class SignUpMainStrings {
  SignUpMainStrings._();
  static const String startedString = 'Let\'s get you started';
  static const String fbButtonString = 'Continue with Facebook';
  static const String googleButtonString = 'Continue with Google';
  static const String appleButtonString = 'Continue with Apple';
  static const String dividerTextString = 'or';
  static const String buttonString = 'Sign in with Password';
  static const String altTextOneString = 'Don\'t have an account ';
  static const String altTextTwoString = 'Sign up';
}

class SignUpStrings {
  SignUpStrings._();
  static const String createString = 'Create Your Account';
  static const String emailHintString = 'Email';
  static const String passwordHintString = 'Password';
  static const String rememberString = 'Remember Me';
  static const String buttonString = 'Sign up';
  static const String dividerString = 'or continue with';
  static const String altTextOneString = 'Already have an account? ';
  static const String altTextTwoString = 'Sign in';
}

class SignInStrings {
  SignInStrings._();
  static const String loginString = 'Login to Your Account';
  static const String emailHintString = 'Email';
  static const String passwordHintString = 'Password';
  static const String rememberString = 'Remember Me';
  static const String buttonString = 'Sign in';
  static const String forgotPasswordString = 'Forgot the password?';
  static const String dividerString = 'or continue with';
  static const String altTextOneString = 'Don\'t have an account? ';
  static const String altTextTwoString = 'Sign up';
}

class ChooseInterestStrings {
  ChooseInterestStrings._();
  static const String titleString = 'Choose Your Interest';
  static const String bodyTextString =
      'Choose your interests and get the best movie recommendations. Don\'t worry, You can always change it later';
  static const String skipButtonString = 'Skip';
  static const String continueButtonString = 'Continue';
}

class FillProfileStrings {
  FillProfileStrings._();
  static const String titleString = 'Fill Your Profile';
  static const String fullNameHintString = 'Full Name';
  static const String nickNameHintString = 'Nickname';
  static const String emailHintString = 'Email';
  static const String phoneNumberHintString = 'Phone Number';
  static const String skipButtonString = 'Skip';
  static const String continueButtonString = 'Continue';
}

class SignUpCompletedPopupStrings {
  SignUpCompletedPopupStrings._();
  static const String titleString = 'Congratulatins';
  static const String textString =
      'Your account is ready to use. You will be redirected to Home page in a few seconds';
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
