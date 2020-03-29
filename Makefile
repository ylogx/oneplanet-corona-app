all: run

run:
	flutter run

generate:
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	flutter generate

generate_watch:
	flutter pub run build_runner watch

install:
	flutter build ios
	flutter install ios

cleanup:
	flutter clean
	pushd ios && rm Podfile.lock && pod deintegrate && pod install && popd

apk:
	flutter build apk
	flutter install apk
