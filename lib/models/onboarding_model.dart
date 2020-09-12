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
    OnBoardingModel(
      'Produk Laukita',
      'Citarasa adalah sesuatu yang tak ternilai harganya yang telah diwariskan generasi ke generasi, yang terus berkembang namun tetap sejati kepada sejarahnya. Laukita berusaha untuk menjadi pemasok makanan siap saji terbesar. Tidak hanya menyediakan hidangan lezat dan praktis tetapi juga makanan higienis dan tahan lama untuk menjangkau konsumen di pelosok dunia. Dengan mengelola ekosistem yang saling terkait, tim kami terus bekerja untuk menyediakan makanan yang lezat, praktis dan efisien.',
      'assets/images/a.jpg',
      false,
      true
    ),
    OnBoardingModel(
      'Frozen Food', 
      'Frozen Food adalah olahan makanan setengah matang yang dikemas dan dibekukan untuk diolah kembali dengan cara memanaskannya. Kehidupan masyarakat kota yang serba cepat menuntut adanya ketersediaan makanan yang dapat diolah dengan mudah dalam waktu singkat. Laukita memberikan kemudahan kepada Anda yang biasanya memiliki kesibukan yang relatif lebih tinggi untuk tetap dapat menikmati satapan siap saji dengan hidangan lezat, praktis, higienis dan dengan harga yang terjangkau.', 
      'assets/images/c.jpg', 
      false, 
      false
    ),
    OnBoardingModel(
      'Referral Agent', 
      'Dengan menjadi Referral Agent, anda akan mendapatkan berbagai keuntungan. Dari segi harga terbaik, kemudahan pemesanan, pengiriman dengan jadwal yang anda tentukan, satuan maupun secara rutin! Caranya sangat mudah, cukup download Aplikasi Laukita & anda dapat langsung mendaftarkan diri sebagai Referral Agent dalam sekejap.', 
      'assets/images/man_and_girl.svg', 
      true, 
      true
    ),
    OnBoardingModel(
      'Business opportunity',
      'Jadi Distributor Laukita! Bergabung dengan kami dan dapatkan berbagai keuntungan, seperti: Berkesempatan mendapat profit 40 – 100 juta per bulan, Pencarian Agen dibantu oleh tim Laukita, Mendapatkan program monitoring dan pengembangan usaha distributor, Mendapatkan bantuan monitoring dan pelayanan agen milik distributor, serta Didukung oleh program promosi yang terpusat.', 
      'assets/images/blm_laptop.svg', 
      true, 
      true
    ),
  ];
}