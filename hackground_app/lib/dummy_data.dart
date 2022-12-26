import 'domain/models/attraction_model.dart';
import 'domain/models/guide_model.dart';
import 'domain/models/review.dart';
import 'domain/models/weather_widget_model.dart';

List<WeatherModel> weatherList = [
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_27-512.png', time: '17:00'),
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_6-512.png', time: '18:00'),
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_17-512.png', time: '19:00'),
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_15-512.png', time: '20:00'),
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_17-512.png', time: '21:00'),
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_9-256.png', time: '22:00'),
  WeatherModel(
      imgSrc: 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_1-512.png', time: '23:00'),
  WeatherModel(imgSrc: 'https://cdn0.iconfinder.com/data/icons/weather-line-19/32/Snow-256.png', time: '00:00'),
];

List<Attraction> attractionListHouse = [
  Attraction(
      imgSrc: 'assets/images/Aleksa.jpg',
      name: 'Александровский',
      starRating: 4.0,
      distance: 1.05,
      price: 11000,
      reviewCount: 410,
      distType: 'км',
      address: 'пр. Мира, 29',
      description:
          '«Александровский» - первый 4-звездочный отель мирового уровня, расположенный в самом центре Владикавказа, столицы Северной Осетии. Пребывание в отеле позволит Вам окунуться в атмосферу элегантной роскоши и величия императорской эпохи...'),
  Attraction(
    imgSrc: 'assets/images/lux.jpg',
    name: 'Планета Люкс',
    starRating: 4.7,
    distance: 300,
    price: 4763,
    reviewCount: 230,
    distType: 'м',
    address: 'ул. Ватутина, 50',
  ),
  Attraction(
    imgSrc: 'assets/images/moscow.jpg',
    name: 'Отель Москва',
    starRating: 4.7,
    distance: 3.8,
    price: 3000,
    reviewCount: 174,
    distType: 'км',
    address: 'Московское ш., 1А',
  ),
  Attraction(
    imgSrc: 'assets/images/depart.jpg',
    name: 'DoubleTree by Hilton Vladikavkaz',
    starRating: 5.0,
    distance: 1.46,
    price: 8500,
    reviewCount: 917,
    distType: 'км',
    address: 'ул. Коцоева, 73',
  ),
];

List<Attraction> attractionListPlace = [
  Attraction(
    imgSrc: 'assets/images/church.jpg',
    name: 'Церковь Рождества',
    starRating: 5.0,
    distance: 1.5,
    price: 0,
    reviewCount: 980,
    distType: 'км',
    address: 'ул. Рождественская, 22',
  ),
  Attraction(
    imgSrc: 'assets/images/kirxa.jpg',
    name: 'Лютеранская кирха',
    starRating: 4.9,
    distance: 1.65,
    price: 0,
    reviewCount: 139,
    distType: 'км',
    address: 'ул. Миллера, 34',
  ),
  Attraction(
      imgSrc: 'assets/images/prospekt.jpg',
      name: 'Проспект Мира',
      starRating: 4.8,
      distance: 1.7,
      price: 0,
      reviewCount: 1789,
      distType: 'км',
      address: 'Проспект Мира'),
  Attraction(
    imgSrc: 'assets/images/memorial.jpg',
    name: 'Мемориал Славы',
    starRating: 4.5,
    distance: 4,
    price: 0,
    reviewCount: 543,
    distType: 'км',
    address: 'Парк Мемориал Славы',
  ),
];

List<Attraction> attractionListEvents = [
  Attraction(
    imgSrc: 'assets/images/kel.jpg',
    name: 'Щелкунчик',
    date: '27 декабря',
    clock: '19:00',
    address: 'КЗ СОГУ',
    price: 1500,
    distance: 95,
    distType: 'м',
  ),
  Attraction(
    imgSrc: 'assets/images/onegin.jpg',
    name: 'Евгений Онегин',
    date: '19 декабря',
    clock: '19:00',
    address: 'КЗ СОГУ',
    price: 2000,
    distance: 1.5,
    distType: 'км',
  ),
];

List<Guide> guideList = [
  Guide(
    //  avatar: Картинка,
    name: 'Иван Волошин',
    isCar: true,
    carName: 'Toyota Hiace',
    starRating: 4.6,
    reviewCount: 13,
    actualRoutesCount: 27,
    lastRoute: '2 мая 2022',
  ),
  Guide(
    //  avatar: Картинка,
    name: 'Мурат Тебиев',
    isCar: false,
    starRating: 4.5,
    reviewCount: 5,
    actualRoutesCount: 8,
    lastRoute: '10 мая 2022',
  ),
  Guide(
    //  avatar: Картинка,
    name: 'Владимир Соколов',
    isCar: true,
    carName: 'Hyunday Staria',
    starRating: 4.8,
    reviewCount: 24,
    actualRoutesCount: 12,
    lastRoute: '20 апреля 2022',
  ),
  Guide(
    //  avatar: Картинка,
    name: 'Георгий Габисов',
    isCar: false,
    starRating: 4.2,
    reviewCount: 64,
    actualRoutesCount: 5,
    lastRoute: '14 декабря 2021',
  ),
  Guide(
    //  avatar: Картинка,
    name: 'Аслан Кудзаев',
    isCar: true,
    carName: 'LADA GRANTA',
    starRating: 4.9,
    reviewCount: 904,
    actualRoutesCount: 44,
    lastRoute: '27 января 2022',
  ),
];

List<Review> reviewList = [
  Review(
      name: 'Олег',
      date: '11 ноября',
      rating: 5.0,
      description:
          'Очень хорошая и недешёвая гостиница, современная, комфортная, просторные удобные номера, панорамные окна, большие удобные кровати, все удобства...',
      avatarUrl: 'https://i.pinimg.com/564x/b4/3a/89/b43a892e3f68c50a5b7ce996aa41a1af.jpg')
];
