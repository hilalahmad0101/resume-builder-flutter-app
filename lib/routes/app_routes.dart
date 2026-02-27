import 'package:get/get.dart';
import 'package:resumebuilder/features/auth/screens/create_account_screen.dart';
import 'package:resumebuilder/features/auth/screens/forget_password_screen.dart';
import 'package:resumebuilder/features/auth/screens/login_screen.dart';
import 'package:resumebuilder/features/auth/screens/reset_password_screen.dart';
import 'package:resumebuilder/features/auth/screens/verify_email_screen.dart';
import 'package:resumebuilder/features/home/screens/home_screen.dart';
import 'package:resumebuilder/features/templates/screens/template_gallery_screen.dart';
import 'package:resumebuilder/features/splash/screens/splash_screen.dart';
import 'package:resumebuilder/features/editor/screens/personal_info_screen.dart';
import 'package:resumebuilder/features/editor/screens/work_experience_screen.dart';
import 'package:resumebuilder/features/editor/screens/education_screen.dart';
import 'package:resumebuilder/features/editor/screens/skills_languages_screen.dart';
import 'package:resumebuilder/features/preview/screens/resume_preview_screen.dart';
import 'package:resumebuilder/features/settings/screens/settings_screen.dart';
import 'package:resumebuilder/routes/routes.dart';

class UAppRoutes {
  static final screens = [
    GetPage(name: URoutes.splash, page: () => const SplashScreen()),
    GetPage(name: URoutes.login, page: () => const LoginScreen()),
    GetPage(
      name: URoutes.createAccount,
      page: () => const CreateAccountScreen(),
    ),
    GetPage(
      name: URoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(
      name: URoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(name: URoutes.home, page: () => const HomeScreen()),
    GetPage(name: URoutes.templates, page: () => const TemplateGalleryScreen()),
    GetPage(name: URoutes.personalInfo, page: () => const PersonalInfoScreen()),
    GetPage(
      name: URoutes.workExperience,
      page: () => const WorkExperienceScreen(),
    ),
    GetPage(name: URoutes.education, page: () => const EducationScreen()),
    GetPage(
      name: URoutes.skillsLanguages,
      page: () => const SkillsLanguagesScreen(),
    ),
    GetPage(
      name: URoutes.previewExport,
      page: () => const ResumePreviewScreen(),
    ),
    GetPage(name: URoutes.settings, page: () => const SettingsScreen()),
  ];
}
