# AGENTS.md

## Project Overview

This is a Flutter interview preparation app.

The app helps users prepare for technical interviews by organizing interview questions, sample answers, categories, difficulty levels, favorites, and practice progress.

The current priority is building a simple MVP that is easy to maintain and expand.

Primary goals:
- Simple and readable Flutter codebase
- Feature-based project structure
- Maintainable state management with Riverpod
- Clear separation between UI, state, and data logic
- Easy future expansion for local storage, API, and monetization

---

## Tech Stack

Use the following stack unless explicitly instructed otherwise:

- Flutter
- Dart
- Riverpod for state management
- GoRouter for navigation
- Dio for API communication if API is needed
- Freezed for immutable models when needed
- json_serializable for JSON parsing when needed

Do not introduce new major dependencies without explaining why they are necessary.

---

## MVP Scope Rules

This app is currently in MVP stage.

Prioritize:
- Interview question list
- Question detail screen
- Category filter
- Difficulty filter
- Favorite questions
- Practice mode
- Local mock data
- Simple progress tracking

Do not add the following unless explicitly requested:
- Login
- Authentication
- Leaderboard
- Payment
- Subscription
- Chat feature
- AI answer generation
- Complex backend
- Push notifications

---

## Language Rules

- Code, class names, variable names, and comments should be written in English.
- User-facing text may support Korean, Japanese, and English later.
- Avoid hardcoding user-facing strings directly in widgets when the text is likely to be reused.
- Keep naming clear and descriptive.
- Do not use vague names such as `Data`, `Manager`, `Common`, `Util`, or `Temp`.

---

## Documentation Rules

Use DartDoc comments with `///` only when they help explain complex logic.

Rules:
- Do not add comments to obvious code.
- Do not add comments to simple widgets, simple models, or simple providers.
- Add comments only when the logic is difficult to understand from naming alone.
- Add comments for complex business rules, calculations, filtering, sorting, state transitions, or non-obvious edge cases.
- Prefer clear naming and small functions over excessive comments.
- Keep comments short and practical.
- Update comments when changing the related logic.
- Do not write comments that simply repeat what the code already says.

---

## Architecture Rules

Use feature-first architecture.

Preferred structure:

```txt
lib/
  core/
    constants/
    errors/
    network/
    router/
    theme/
    utils/

  features/
    interview_questions/
      data/
        datasources/
        models/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        pages/
        widgets/
        providers/

    practice/
      data/
      domain/
      presentation/

    favorites/
      data/
      domain/
      presentation/

    settings/
      data/
      domain/
      presentation/

  shared/
    widgets/
    extensions/
    providers/

  main.dart
  