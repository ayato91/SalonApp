List colorlist = [0xff346678, 0xff55887658, 0xffe3ffd4];
List imageList = [
  'https://img.freepik.com/free-vector/realistic-barbershop-horizontal-banner-template_52683-94963.jpg?w=1380&t=st=1699874500~exp=1699875100~hmac=e067ad7ad4c35d8532e5d2d98480e7d2c933680884ff941793c33ab9be0b011e',
  'https://img.freepik.com/free-photo/young-man-barbershop-trimming-hair_1303-26254.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699660800&semt=ais',
  'https://media.istockphoto.com/id/640274128/photo/barber-using-scissors-and-comb.jpg?s=612x612&w=0&k=20&c=mjdP6NhDA40WBorr8kyyI69waMs1EyzLkSmT6lQRvGU=',
];
List<String> pageTitles = [
    '',
    'Category',
    'Calender',
    'Messaging',
    'My Profile'
  ];
List<String> ctgList = [
  'Hair Cut',
  'Makeup',
  'Straightening',
  'Mani-Pedi',
  'Spa/ Massage',
  'Beard Trimming',
  'Hair Coloring',
  'Waxing',
  'Facial'
];
List<String> serviceList = [
  'All',
  'Haircuts',
  'Make up',
  'Manicure',
  'Straightening',
  'Spa/ Massage',
  'Beard Trimming',
  'Hair Coloring',
  'Waxing',
  'Facial'
];
String name = 'Sushma Shukla';
String greet = greetings();

String greetings() {
  var hour = DateTime.now().hour;
  if (hour > 4 && hour < 12) {
    return 'Morning';
  } else if (hour < 13 && hour >= 12) {
    return 'Noon';
  } else if (hour >= 13 && hour < 17) {
    return 'Afternoon';
  } else if (hour >= 17 && hour < 23) {
    return 'Evening';
  }
  return 'Late Evening';
}
