.PHONY: help install clean run-android run-ios test analyze format firebase-config

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install dependencies
	flutter pub get

clean: ## Clean build artifacts
	flutter clean
	flutter pub get

run-android: ## Run on Android device/emulator
	flutter run -d android

run-ios: ## Run on iOS device/simulator
	flutter run -d ios

test: ## Run tests
	flutter test

analyze: ## Analyze code for issues
	flutter analyze

format: ## Format code
	dart format lib/ test/

firebase-config: ## Configure Firebase using FlutterFire CLI
	flutterfire configure

build-android: ## Build Android APK
	flutter build apk --release

build-ios: ## Build iOS app
	flutter build ios --release

doctor: ## Check Flutter environment
	flutter doctor -v

upgrade: ## Upgrade dependencies
	flutter pub upgrade
