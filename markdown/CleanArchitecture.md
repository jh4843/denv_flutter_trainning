# Clean Architecture

- reference
  - https://github.com/rodydavis/flutter_todo_app/
  - https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0
  - https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47
  - https://github.com/Uuttssaavv/flutter-clean-architecture-riverpod/tree/master

```
lib/
├── domain/   <-- Core business logic and utilities
│   ├── models/    <-- Domain entities or models
│   ├── repositories/    <-- Abstract repository interfaces
│   └── usecases/    <-- Use cases or interactors
├── data/   <-- Data layer
│   ├── datasources/    <-- Implementations of data sources (e.g., API, local database)
│   ├── models/    <-- Data models or DTOs
│   ├── repositories/    <-- Concrete repository implementations
│   └── repositories_impl.dart    <-- Repository implementation provider
├── presentation/   <-- Presentation layer (UI)
│   ├── pages/    <-- Screen pages
│   ├── widgets/    <-- Reusable UI components
│   ├── providers/    <-- (Riverpod) state management classes
│   └── routes.dart    <-- App routes definition
└── main.dart    <-- Entry point of the app
```

explains

In this structure, the **core** directory contains the core business logic and utilities. The **entities** folder holds domain entities or models, while the **repositories** folder contains abstract repository interfaces. The **usecases** folder consists of use cases or interactors that implement the application-specific business rules.

The **data** directory represents the data layer and includes **datasources** to provide implementations of various data sources (e.g., API, local database). The **models** folder contains data models or DTOs specific to the data layer. The **repositories** folder in the **data** layer holds concrete repository implementations, and the **repositories_impl.dart** file acts as the provider for the repository implementations.

The **presentation** directory focuses on the UI and contains the **pages** folder for screen pages, **widgets** for reusable UI components, and **blocs** for BLoC or state management classes. The **routes.dart **file defines the application routes.

Finally, the **main.dart** file serves as the entry point of the app.

Remember, the directory structure can vary based on the complexity and requirements of your application. It's essential to adapt and tailor it to your specific project needs while adhering to the principles of Clean Architecture.

## Presentation

#### pages

#### repositories

## domain

#### entities

#### repositories

#### usecases

## Data

#### pages

#### widgets
