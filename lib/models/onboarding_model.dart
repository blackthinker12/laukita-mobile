part of 'models.dart';

class OnBoardingModel {
  String imageUrl;
  String title;
  String description;
  bool isSVG;
  bool is350;

  OnBoardingModel(this.title, this.description, this.imageUrl, this.isSVG, this.is350);
}

List<OnBoardingModel> getOnBoardingItems(){
  return <OnBoardingModel>[
    OnBoardingModel('Laukita product introduction', 'Lorem ipsum dolor sit amet. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'assets/images/a.jpg', false, true),
    OnBoardingModel('Frozen Food', 'Lorem ipsum dolor sit amet. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'assets/images/c.jpg', false, false),
    OnBoardingModel('Referral Agent', 'Lorem ipsum dolor sit amet. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'assets/images/man_and_girl.svg', true, true),
    OnBoardingModel('Business opportunity', 'Lorem ipsum dolor sit amet. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'assets/images/blm_laptop.svg', true, true),
  ];
}