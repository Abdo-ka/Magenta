Changelog
[v1.0.0] - 2024-09-21
Added

- Flutter dynamic scrolling: Implemented dynamic scrolling functionality for navigating to specific widgets based on category selection.
- Favorite items: Added the ability to mark items as favorites and implemented a feature to change the icon color when an item is added or removed from the favorites list.
- BLoC pattern: Introduced BLoC architecture for state management, improving the app’s modularity and responsiveness.
- Sign-Up page validation: Enhanced form validation on the sign-up page for email, username, phone number, password, and confirm password fields.

Fixed

- Confirm password validation issue: Resolved an issue where the confirm password validation incorrectly flagged mismatches even when the passwords matched.
- 401 error on API requests: Addressed an authentication issue, ensuring proper login handling for API requests on real devices.

CI/CD

- Set up Codemagic CI workflow to automate builds and deploy APKs via Telegram.
