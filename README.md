# Flutter API Test

## General Project Information

**Project Name**: Flutter API Test

**Description**: This app allows users to view a list of dog breeds fetched from an API, with the ability to view detailed information about each breed (such as weight, height, temperament, and origin).

**Technologies Used**:
- **Flutter**: Framework for mobile app development.
- **Dart**: Programming language used by Flutter.
- **HTTP**: Package to make API requests.
- **The Dog API**: Third-party API used to fetch dog breed information.

## Application Flow
Main Screen (BreedsScreen):

Makes a request to the API via ApiService to fetch the list of breeds.

The data is displayed in a ListView, which includes the breed name and an image.

Tapping on a breed navigates to the details screen for that breed.

Detail Screen (BreedDetailScreen):

Displays detailed information about the selected breed, including temperament, weight, height, origin, and an image.

Uses ListView to organize the information and allow scrolling when the content is large.

## API Requirements
The API used is The Dog API, a public API providing information on dog breeds.

Base URL: https://api.thedogapi.com/v1

Endpoints Used:

GET /breeds: Fetches the list of dog breeds.

## Error Handling
Data Loading: If the connection to the API fails, the app displays an error message and a button to retry the data load.

Null Data: If any value from the API is null, it is replaced with a default value ('Unknown', 'Not available', etc.).

## Installation and Execution
Clone the Project:

```
git clone https://github.com/f3rran/flutter_api_test
```


Install Dependencies: Navigate to the project directory and run:

```
flutter pub get
```

Run the Application: In the same directory, run:

```
flutter run
```

View the App: The app will launch in an emulator or connected device. You will see the list of breeds and can view the details for each breed.

## Conclusion
This project uses Flutter to create a simple and functional app that fetches dog breed information from an API and displays it in a clear and organized way. The architecture used is suitable for small to medium-sized projects, and it can be easily scaled by integrating an advanced state management solution or adding new features.