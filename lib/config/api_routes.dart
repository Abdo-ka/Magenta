// This file is generated. Do not edit it manually

class ApiRoutes {
  static const baseUrl = 'https://car-market.switcher-app.com/api/v1/';

  //? ---------------------------------------- Auth ----------------------------------------
  static const register = 'auth/register';
  static completeRegistration(String userId) => 'auth/complete-registration/$userId';
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';
  static const String verifyOtp = 'auth/verify-otp';
  static const String basicAccountRegistration = '/auth/register';
  static const String socialSignInRegistration = 'auth/social-authentication';

  static const String cities = 'cities';
  static const String colors = 'color';
  static const String cylinder = 'cylinder';
  static const String fuelType = 'fuel-type';
  static const String motorSize = 'motor-size';
  static const String plateTypes = 'plate-type';
  static const String tags = '/tags';
  static const String incomeTypes = '/incoming-type';
  static const String carModels = '/car-models';
  static const String carFactories = '/car-factories';
  static const String damageTypes = '/damage-types';

  static const String imageUpload = 'upload-temp-media';

  static const String notifications = '/user/notification';
  static const String readAllNotifications = '/user/mark-all-notifications-as-read';

  static const String getProfile = '/user/profile/me';
  static const String toggleVisibility = '/user/profile/toggle-visibility';
  static const String deleteAccount = '/user/profile/delete-account';
  static const String chats = 'user/chats';
  static String chat(int chatId) => '/user/chats/$chatId';
  static const String startNewChat = '/user/chats/start';
  static String sendMessage(int chatId) => '/user/chats/send/$chatId';
  static const String searchHistory = '/user/search-history';
  static const String updateWorkingTimes = '/user/update-working-days';
  static const String updateProfile = '/user/profile/update-profile';
  static const String companiesPageData = '/companies-home';

  static const String home = '/home';

  static const String cars = '/cars';
  static const String addCar = '/user/cars';

  static const String companies = '/companies';
  static String companyDetails(int id) => '/companies/$id';

  static const String pages = '/pages';

  static const String contactUs = '/contact-us';

  static const String carFaxRequest = '/car-fax-request';

  static const String sliderPlans = '/slider-plans';
}
