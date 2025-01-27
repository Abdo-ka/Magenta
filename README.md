
## Main photo

<div align="center" class="white-background">
  <img src="/images/logo.svg" alt="Abdo_ka" width="100%">
</div>

# Magenta
Magenta is app build on flutter E-commerce app for trading parfums and other things
Used Clean architecture with MVC Structure and clean code 

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

.env_dev.json ,
.env_prod.json and
.env_stag.json

and add inside these files important data like this image:

![env_variable](/images/env_variables.png)

on OTp Code you can add this code " 511834 " which is it static on server side 

P.S : some of Future should rewrite cause backend doesn't deal with it correctly

## Run Application

cause this application is using Flavor to run it should run this command on terminal as you need

Development:

```bash

flutter run --dart-define-from-file=env/.env_dev.json --flavor dev  
```
production:  

```bash

flutter run --dart-define-from-file=env/.env_prod.json --flavor prod
```

staging:

```bash

flutter run --dart-define-from-file=env/.env_stag.json --flavor stag
```

## Build Application

 if you want to build application it should run one of these command on terminal as you need 

Development:
```bash
flutter build apk --release --flavor dev --dart-define-from-file=env/.env_dev.json
```
production:
```bash

flutter build apk --release --flavor prod --dart-define-from-file=env/.env_prod.json
```
staging:
```bash

flutter build apk --release --flavor stag --dart-define-from-file=env/.env_stag.json
```

## Screenshots

![App Screenshot](/images/Home_complete.png)

![App Screenshot](/images/login_magenta.png)

![App Screenshot](/images/Prodact_view.png)

![App Screenshot](/images/verify_number.png)


## Support

For support, [Email](mailto:kanawatiabdalrahman@gmail.com) or chat me on [telegram](https://t.me/Abdo_Ka),[LinkedIn](https://www.linkedin.com/in/abdo-ka) .


## Feedback

If you have any feedback, please reach out to us at [Email](mailto:kanawatiabdalrahman@gmail.com)

