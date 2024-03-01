# 📱 Flutter Movies App

![GitHub license](https://img.shields.io/github/license/Bit-Camp-IO/TMDA-Flutter)
![GitHub last commit](https://img.shields.io/github/last-commit/Bit-Camp-IO/TMDA-Flutter)
![GitHub issues](https://img.shields.io/github/issues/Bit-Camp-IO/TMDA-Flutter)

This repository contains the source code for the Flutter Movies App, which allows users to browse for movies using the TMDB API.
The app provides information such as movie details, ratings and reviews.

## Screenshots
| Home_Screen 1 | Details_Screen 2 | Sub_Category_Screen 3 |
| :----: | :----: | :----:|
| ![Onboard 1](https://i.ibb.co/Jz89jpC/appstore-asset-3.png) | ![Onboard 2](https://i.ibb.co/cC1BD0m/appstore-asset-4.png) | ![Onboard 3](https://i.ibb.co/TB9vC3J/appstore-asset-5.png) |
| SignIn_Screen | SignUp_Screen | Fofget_password_Screen |
| ![Sign-in](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/ff4b4781-72c2-4757-bb33-97c0a274485f) | ![Sign-up](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/cdb3fc6a-291a-423f-adcb-b8a3f9b8221d) | ![Fofget_password](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/8f595571-8f75-47f5-993d-608e91909107) |
| Home_Screen | Favourite_Screen | Cart_Screen |
| ![Home](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/53d3f110-3b23-4aa6-974b-f692fb2e66b6) | ![Favourite](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/c9d7e676-8eca-4e06-8ddc-b03360ff906d) | ![Cart](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/fea2e4d3-726c-4853-a44f-c99cbdf5a935) |
| Profile_Screen | Details_Screen | Category_Screen |
| ![Profile](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/cf3c5206-0229-4155-b630-522947a3ab44) | ![Details](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/4a7dfd70-fd66-40e5-904d-fee99db68760) | ![Category](https://github.com/mohamedsber/MVVM-Ecommerce-FlutterApp/assets/100823196/30c88685-6f2b-497a-84d2-f25080961809) |


## 🚀: Features

- Display Splash screen
- Display a popular, top rated and upcoming list of movies
- Display a sub category with infinty scroll
- Display a movie details page that can be opened from a movie item or adeep link
- Add Push Notification feature using Firebase Cloud notification
- Light and Dark Theme
- 


## Prerequisites

Before running the app, ensure that you have the following:

- Android Studio (version 2022.2.1 or higher) or VS Code.
- Flutter 3.10 and Dart 3.0.1
- TMDB API key ([Sign up](https://www.themoviedb.org/documentation/api) for an account and obtain an API key)

## Getting Started

To get started with the TMDA Android app, follow these steps:

1. Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/Bit-Camp-IO/TMDA-Flutter.git
```

2. Open Android Studio and select "Open an Existing Project."
3. Navigate to the cloned project directory and select it.
4. Android Studio will build and sync the project automatically.
5. Once the project is synced run `flutter pub get`.
6. After the packages load successfully, navigate to the `lib\core\constants` directory in the project.
7. Open `api_constants.dart` and add the following code, replacing `YOUR_API_KEY` with your TMDB API key and replace `YOUR_ACCOUNT_ID` with your TMDB Account ID :
```xml
apiKey = 'YOUR_API_KEY';
accountId = 'YOUR_ACCOUNT_ID';

```

8. Save the file.
9. Run the app on an emulator or physical device by clicking the "Run" button in Android Studio.

## API Usage

The TMDA Android app utilizes the TMDB API to fetch movie and tv shows data. To use the app with the TMDB API, make sure to obtain an API key as mentioned in the prerequisites.

The API key is stored in the `api_constants.dart` file as described in the "Getting Started" section. This key is used by the app to authenticate requests to the TMDB API. Please make sure to keep your API key confidential and avoid exposing it publicly.

## Contributing

Contributions to the TMDA Flutter app are welcome! If you find any issues or want to add new features, please submit an issue or pull request on the GitHub repository.

When contributing, please adhere to the following guidelines:

- Fork the repository and create a new branch for your feature or bug fix.
- Ensure that your code follows the project's code style and conventions.
- Write clear and concise commit messages and provide a detailed description of your changes.
- Test your changes thoroughly before submitting a pull request.

## License

This project is licensed under the ![MIT License](https://img.shields.io/github/license/Bit-Camp-IO/TMDA-Flutter). Feel free to use, modify, and distribute the code as per the terms of the license.

## Acknowledgments

The TMDA Flutter app is built using the TMDB API, which power the whole app's features

. We would like to express our gratitude to the TMDB team for their efforts in providing this valuable resource.

## Contact

If you have any questions, suggestions, or feedback, please contact the project maintainer:

Email: momenmuhammad01@gmail.com\
GitHub: [Bit-Camp-IO](https://github.com/Bit-Camp-IO)
