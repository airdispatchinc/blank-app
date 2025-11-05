# Contributing to Flowline

Thank you for considering contributing to Flowline! This document provides guidelines and instructions for contributing.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/flowline.git`
3. Create a branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Run tests: `flutter test`
6. Commit your changes: `git commit -m "Add your message"`
7. Push to your fork: `git push origin feature/your-feature-name`
8. Create a Pull Request

## Development Guidelines

### Code Style

- Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check for style issues
- Format code with: `dart format .`
- Keep lines under 80 characters when possible
- Use meaningful variable and function names

### Commit Messages

- Use clear and descriptive commit messages
- Start with a verb (Add, Fix, Update, Remove, etc.)
- Keep the first line under 50 characters
- Add detailed description if needed

Examples:
```
Add crowd level indicator to location cards
Fix location permission handling on iOS
Update Firebase rules for better security
```

### Testing

- Write tests for new features
- Ensure all tests pass before submitting PR
- Run: `flutter test`
- Aim for good test coverage

### Pull Requests

- Keep PRs focused on a single feature/fix
- Update documentation if needed
- Add screenshots for UI changes
- Link related issues
- Ensure CI checks pass

## Project Structure

```
lib/
├── main.dart           # Entry point
├── models/             # Data models
├── screens/            # UI screens
├── services/           # Business logic
└── widgets/            # Reusable components
```

## Feature Requests

- Open an issue with label "enhancement"
- Describe the feature and its use case
- Explain why it would be valuable
- Be open to discussion and feedback

## Bug Reports

When reporting bugs, include:
- Flutter version (`flutter --version`)
- Device/OS information
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable

## Questions?

Feel free to open an issue with the "question" label or reach out to the maintainers.

Thank you for contributing! 🎉
