# Base Project

This is a base project for starting new projects.

## Features
- Carthage for dependencies versioning
- Xcodegen to manage modules and generate .xcodeproj. Also with template configurations for app, shared and feature targets.
- Preconfigured network module (Repository) configure with moya, predefined extension to standardize stubbing from json files.
- Rswift preconfigure for each feature module to enable static typed resources.
- Core module with predefined base Controllers, View and ViewModel, Coordinator classes and protocols, based on MVVM-C, to standardize features implementation
- Based on RxSwift framework for reactive programming
- Components module to make visual components reusable thourgh the project 

## To-do's
- Create targets for development, development-stub, staging and production
- Creation of template for test targets
