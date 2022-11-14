import './models/weather_widget_model.dart';
import './models/attraction_model.dart';
import './models/guide_model.dart';

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

List<Attraction> attractionList1 = [
  Attraction(
    imgSrc: 'https://static.tildacdn.com/tild3565-3934-4638-b466-633366663735/photo_2022-05-11_18-.jpg',
    name: 'Хаят',
    starRating: 4.8,
    distance: 319,
    price: 4000,
    reviewCount: 959,
    distType: 'м',
    address: 'Бештаугорское ш. 161',
  ),
  Attraction(
    imgSrc: 'https://cdn.ostrovok.ru/t/1024x768/extranet/media/5eb24bc3ebbf4297b3fa717771e59743.jpg',
    name: 'Ночной Квартал',
    starRating: 4.6,
    distance: 519,
    price: 2400,
    reviewCount: 495,
    distType: 'м',
    address: 'ул. Адмиральского 31а',
  ),
  Attraction(
    imgSrc: 'https://cdn.ostrovok.ru/t/1024x768/content/60/9d/609db600867bc16928810226e43f5b52435fd3ac.jpeg',
    name: 'Дежа Вю',
    starRating: 4.8,
    distance: 1.6,
    price: 3500,
    reviewCount: 959,
    distType: 'км',
    address: 'ул. Ессентукская 74',
  ),
  Attraction(
    imgSrc: 'https://i.pinimg.com/564x/5d/6d/6a/5d6d6ab08fd4325aa3a7826475dd4b7e.jpg',
    name: 'Бештау',
    starRating: 4.2,
    distance: 319,
    price: 5000,
    reviewCount: 102,
    distType: 'км',
    address: '1-я Бульварная ул. 17',
  ),
  Attraction(
    imgSrc: 'https://cdn.ostrovok.ru/t/1024x768/content/82/1c/821c4ce9572772217545f666987c273bf429fe8b.jpeg',
    name: 'Интурист',
    starRating: 4.2,
    distance: 319,
    price: 2300,
    reviewCount: 1299,
    distType: 'км',
    address: 'площадь Ленина 13',
  ),
];
List<Attraction> attractionList2 = [
  Attraction(
    imgSrc: 'http://s1.fotokto.ru/photo/full/640/6408566.jpg',
    name: 'Эолофа арфа',
    starRating: 4.7,
    distance: 319,
    reviewCount: 980,
    distType: 'м',
  ),
  Attraction(
    imgSrc: 'https://img.tourister.ru/files/2/3/4/5/2/9/2/7/original.jpg',
    name: 'Место дуэли М. Ю. Лермонтова',
    starRating: 4.9,
    distance: 519,
    reviewCount: 139,
    distType: 'м',
  ),
  Attraction(
    imgSrc: 'http://s4.fotokto.ru/photo/full/293/2930369.jpg',
    name: 'Ворота Любви',
    starRating: 4.8,
    distance: 1.6,
    reviewCount: 1789,
    distType: 'км',
  ),
  Attraction(
    imgSrc: 'https://fs3.fotoload.ru/f/1118/1542523278/bf8e4bf83e.jpg',
    name: 'Китайская беседка',
    starRating: 4.55,
    distance: 2.7,
    reviewCount: 54,
    distType: 'км',
  ),
  Attraction(
    imgSrc: 'http://dnevnikbeloshveiki.ru/wp-content/uploads/2018/07/068.jpg',
    name: 'Сероводородные ванны',
    starRating: 4.77,
    distance: 7.8,
    reviewCount: 3699,
    distType: 'км',
  ),
];

List<Attraction> attractionList3 = [
  Attraction(
    imgSrc: 'https://vsrap.ru/wp-content/uploads/2020/08/maxkorzh-e1596907664553.jpg',
    name: 'Концерт Макса Коржа',
    date: '19 мая, 19:00',
    address: "Ватутина 17",
    price: 1500,
    distance: 879,
    distType: 'м',
    cardPush: true,
  ),
  Attraction(
    imgSrc: 'https://akademichesky.mos.ru/upload/medialibrary/f82/yarmarka-vykhodnogo-dnya.jpg',
    name: 'Ярмарка',
    date: '24 мая, 11:00',
    address: "проспект Мира 28",
    distance: 890,
    distType: 'м',
    cardPush: false,
  ),
  Attraction(
    imgSrc: 'https://placepic.ru/wp-content/uploads/2019/07/ushanov-15.jpg',
    name: 'Салют',
    date: '24 августа, 22:00',
    address: "Площадь Победы",
    distance: 3.2,
    distType: 'км',
    cardPush: false,
  ),
  Attraction(
    imgSrc: 'https://cdn.pbilet.com/origin/574c7bcc-2b13-43ea-81a3-186e12b29881.jpeg',
    name: 'Концерт Би-2',
    date: '17 мая, 23:00',
    address: "Горько 34",
    price: 2500,
    distance: 4.3,
    distType: 'км',
    cardPush: true,
  ),
  Attraction(
    imgSrc: 'https://i.pinimg.com/originals/53/0d/9a/530d9a5703ada7cc8eacbb4d8b5beb5f.jpg',
    name: 'Концерт Скриптонита',
    date: '23 июля, 00:00',
    address: "Николаева 76",
    price: 4500,
    distance: 1.2,
    distType: 'км',
    cardPush: false,
  ),
];

List<Guide> guideList = [
  Guide(
    //  avatar: Картинка,
    name: "Иван Волошин",
    isCar: true,
    carName: "Toyota Hiace",
    starRating: 4.6,
    reviewCount: 13,
    actualRoutesCount: 27,
    lastRoute: '2 мая 2022',
  ),
  Guide(
    //  avatar: Картинка,
    name: "Мурат Тебиев",
    isCar: false,
    starRating: 4.5,
    reviewCount: 5,
    actualRoutesCount: 8,
    lastRoute: '10 мая 2022',
  ),
  Guide(
    //  avatar: Картинка,
    name: "Владимир Соколов",
    isCar: true,
    carName: "Hyunday Staria",
    starRating: 4.8,
    reviewCount: 24,
    actualRoutesCount: 12,
    lastRoute: '20 апреля 2022',
  ),
  Guide(
    //  avatar: Картинка,
    name: "Георгий Габисов",
    isCar: false,
    starRating: 4.2,
    reviewCount: 64,
    actualRoutesCount: 5,
    lastRoute: '14 декабря 2021',
  ),
  Guide(
    //  avatar: Картинка,
    name: "Аслан Кудзаев",
    isCar: true,
    carName: "LADA GRANTA",
    starRating: 4.9,
    reviewCount: 904,
    actualRoutesCount: 44,
    lastRoute: '27 января 2022',
  ),
];
