import 'dart:math';

///
/// .csv 파일 등으로 대체될 예정
///
class FCommonString {
  static const email = "이메일";
  static const password = "비밀번호";
  static const login = "로그인";
  static const recommendedIt = "추천하였습니다.";
  static const didNotRecommendedIt = "비추천하였습니다.";
  static const sentCupOfCoffee = "커피 한잔을 보냈습니다.";
  static const recommendedHot = "핫 게시글로 추천했습니다.";

  static const welcomeTodayTitle = "오늘은 어떤 이야기가 숨어 있을까요?";
  static const welcomeCreateAccount = "계정 생성";
  static const welcomeAlreadyAccont = "이미 계정이 있으신가요?";

  static const signUpSignUp = "등록하기";
  static const signUpName = "이름";
  static const signUpConfrimPassword = "비밀번호 확인";
  static const signUpPleaseEnterName = "이름을 입력하세요.";
  static const signUpPleaseEnterEmail = "이메일을 입력하세요.";
  static const signUpNameLengthCannotExceed27Character = "이름의 길이 제한은 27자 입니다.";
  static const signUpPleaseFillFormCarefully = "양식을 채워주세요.";
  static const signUpPasswordAndConfirmPasswordDidNotMatch = "비밀번호가 맞지 않습니다.";

  static const signInSignIn = "로그인";

  static const error = "흑흑! 에러가 발생했어요!";
  static const warning = "흑흑! 문제가 발생했어요!";
  static const findUserError = "앗! 사용자를 찾을 수 없습니다!";
  static const getUserError = "앗! 사용자 정보를 가져올 수 없습니다!";

  static const follower = "팔로워";
  static const secretCount = "비밀";
  static const uncoveredCount = "밝혀진 비밀";

  static const remainedTime = "남은 시간";
  static const search = "검색";
  static const getFeedError = "피드를 가져오는데 실패했어요!";
  static const veryHotSecretFeedRightNow = "지금 굉장히 핫한 비밀 피드";

  static String randomWelcome(String name) {
    final random = Random();
    final index = random.nextInt(4);
    switch (index) {
      case 0:
        return "환영합니다, $name님";
      case 1:
        return "$name님, 환영해요!";
      case 2:
        return "반갑습니다 $name님";
      case 3:
        return "안녕하세요 $name님";
    }

    return "$name님, 어서오세요!";
  }
}
