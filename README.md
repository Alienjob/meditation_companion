# Meditation Companion

An interactive meditation app that transforms your meditation practice through personalized real-time guidance and adaptive feedback.

## Project Status

### Authentication Implementation ✅
- Model Layer: Pure data classes with const constructors
- Repository Layer: Mock and Supabase implementations
- BLoC Pattern: Clean state management
- Environment: VSCode-based configuration with Command Variable extension
- Testing: Comprehensive unit tests

## Getting Started

### Prerequisites
1. Flutter SDK
2. VSCode
3. Command Variable extension for VSCode
   - Name: Command Variable
   - ID: rioj7.command-variable
   - [Install from Marketplace](https://marketplace.visualstudio.com/items?itemName=rioj7.command-variable)

### Development Setup
1. Clone the repository
```bash
git clone https://github.com/Alienjob/meditation_companion.git
```

2. Install dependencies
```bash
cd meditation_companion/app
flutter pub get
```

3. Configure environment
```bash
cp .vscode/launch.variables.template.json .vscode/launch.variables.json
```
Edit `.vscode/launch.variables.json` with your Supabase credentials.

4. Run the app using VSCode's launch configuration
   - Open in VSCode
   - Select 'meditation_companion (dev)' configuration
   - Press F5 or click Run

## Project Structure

```
app/
├── lib/
│   ├── config/           # Configuration management
│   └── features/
│       └── auth/         # Authentication feature
│           ├── bloc/     # State management
│           ├── models/   # Data models
│           ├── repository/# Data layer
│           └── views/    # UI components
├── test/                 # Test files
└── docs/                 # Documentation
```

## Documentation
- [Environment Setup](docs/setup/environment.md)
- [Model Conventions](docs/code_conventions/models.md)
- [Auth Implementation](docs/mvp/1%20-%20User%20Authentication%20Setup.md)

## Tech Stack
- Flutter for cross-platform development
- Supabase for backend services
- BLoC for state management
- VSCode with Command Variable for development

## Contributing
1. Check existing issues or create a new one
2. Fork the repository
3. Create a feature branch
4. Submit a pull request

## License
This project is licensed under the MIT License - see the LICENSE file for details