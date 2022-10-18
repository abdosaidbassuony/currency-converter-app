# CurrencyConverterApp

## Introduction

`CurrencyConverterApp` is a simple app which displays list of all countries fetched
from https://free.currencyconverterapi.com/ and allows conversion between different currencies. And
displays Historical data for 2 currencies of your choosing for the last 7 days

## Requirements

* Android studio latest version 4+
* Flutter 3.0.5 & Dart 2.17.6
* kotlin_version 1.6.1
* Emulator / real device

## Installation

* Clone this repository and import into Android Studio<br>
  `git clone https://github.com/abdosaidbassuony/currency-converter-app.git`

## Generating signed APK

From Android Studio:

1. ***Build*** menu
2. ***Generate Signed APK...***
3. Fill in the keystore information *(you only need to do this once manually and then let Android
   Studio remember it)*

## Questions And Answers

* I approached it using :-
    * Clean architecture
    * Bloc State Management Library
    * get_it as Service locator to provide my required dependencies
    * Dio & Retrofit (to work with API requests)
    * Repository design pattern (to group requests)
    * Drift (to save all data locally)
    * Base StatefulWidget (to handle state of all screen form single widget)
    * mixin LoadingManager (to handle loading state)

clean architecture enforces the separations of concerns dividing the software into layers. Each one
of these layers focuses on doing one single thing, so it follows the Single Responsibility
Principle. They also have their own Model representations and any communication needed with external
layers are made through the use of abstractions.<br>
get_it used to provide dependencies based on service locator pattern.<br>
drift is used to save every data locally and avoid using other packages due to the easier way to
work with data.<br>
bloc is used to handle widget state and avoid using other state managements because it provides
architecture, scalability, readability, complexity, etc.<br>
