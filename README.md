
## Main photo
<div align="center">
  <img src="/images/logo.svg" alt="Abdo_ka" width="100%">
</div>

# Magenta
Magenta is app build on flutter
Used Clean architecture with MVC Structure and clean code 


## Authors

- [@Abdo_Ka](https://www.github.com/Abdo-ka)



## 🚀 About Me
I'm a software Engineering specialist on Android and IOS app developer Using Flutter Freamwork
Have over 4 years of expreiance and also have more than 5 apps on google play



## Run Locally

Clone the project

```bash
  git clone https://github.com/Abdo-ka/Magenta.git
```

Go to the project directory

```bash
  cd Magenta
```

Install dependencies 

```bash 
  flutter pub get
```

Install dependencies on packages 

```bash 
  cd packages
  flutter pub get 
```
## Important ⚠️⚠️

If you want to run app You should add on the main project folder env inside it you should add 

.env_dev.json
.env_prod.json
.env_stag.json

and add inside these files important data like this image:

![env_variable](/images/env_variables.png)


## Run Application

cause this application is using Flavor to run it should run this command on terminal as you need

```bash
Development:

flutter run --dart-define-from-file=env/.env_dev.json --flavor dev  
```
```bash
production:  
flutter run --dart-define-from-file=env/.env_prod.json --flavor prod
```

```bash
staging:
flutter run --dart-define-from-file=env/.env_stag.json --flavor stag
```
## Build Application

 if you want to build application it should run one of these command on terminal as you need 

```bash
Development:
flutter build apk --release --flavor dev --dart-define-from-file=env/.env_dev.json
```

```bash
production:
flutter build apk --release --flavor prod --dart-define-from-file=env/.env_prod.json
```

```bash
staging:
flutter build apk --release --flavor stag --dart-define-from-file=env/.env_stag.json
```

## Screenshots

![App Screenshot](/images/Home_complete.png)

![App Screenshot](/images/login_magenta.png)

![App Screenshot](/images/Prodact_view.png)

![App Screenshot](/images/verify_number.png)


## Support

For support, [Email](mailto:kanawatiabdalrahman@gmail.com) or chat me on [telegram](https://t.me/Abdo_Ka),[LinkedIn](https://www.linkedin.com/in/abd-alrahman-kanawati-56322b228) .


## Feedback

If you have any feedback, please reach out to us at [Email](mailto:kanawatiabdalrahman@gmail.com)

