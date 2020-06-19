# Coronavirus Tracker App

This was sprint project to hash out the code and release an (Android & iOS) app in their corresponding Play/App Store over the weekend.


### Project Repos

* ***App***: [ylogx/oneplanet-corona-app](https://github.com/ylogx/oneplanet-corona-app)
  - The app is written in dart with [Flutter][flutter] framework and works on both Android & iOS. App supports dark & light mode.
* API Backend: [ylogx/oneplanet-corona-backend](https://github.com/ylogx/oneplanet-corona-backend)
  - The app reads data from backend REST API written in GoLang, containerized using [Docker][docker] and deployed on Google Cloud using [Cloud Run][gc-cloud-run].
* App Webpage: [ylogx/oneplanet-corona-web](https://github.com/ylogx/oneplanet-corona-web)
  - The app's webpage is a requirement for submitting the app to App/Play Store ([privacy page][privacy-page], tos page, etc.)

---

### Development

To build the application, use: `flutter build`. 
There are tons of useful commands in Makefile like `make apk` for building release apk, `make install` for installing on iOS.

### Screenshots

<div>
<img src="https://user-images.githubusercontent.com/3508878/85108927-8aef0e00-b1de-11ea-8e00-1c50bc56f4d7.PNG" width="220"/>
<img src="https://user-images.githubusercontent.com/3508878/85108929-8aef0e00-b1de-11ea-94f3-c995645b3b79.PNG" width="220"/>
<img src="https://user-images.githubusercontent.com/3508878/85108922-8a567780-b1de-11ea-86e0-53bf3f81826d.PNG" width="220"/>
</div>

[gc-cloud-run]: https://cloud.google.com/run/
[docker]: https://shubham.chaudhary.xyz/blog/docker/101
[privacy-page]: https://corona.oneplanet.us/privacy
[flutter]: https://flutter.dev/
