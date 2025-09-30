# Environment Setup

## Prerequisites

1. Install the VSCode extension:
   - Name: Command Variable
   - ID: rioj7.command-variable
   - Link: https://marketplace.visualstudio.com/items?itemName=rioj7.command-variable

## Development Environment

### 1. Configuration Structure
We use a combination of:
- Versioned launch configuration (.vscode/launch.json)
- Unversioned secrets (secrets/secrets.json)

```
project_root/
├── .vscode/
│   └── launch.json           # Launch configurations referencing secrets
└── secrets/
    └── secrets.json         # Unversioned file with actual values
```

### 2. Setup Steps

1. Create `secrets/secrets.json` with your values:
```json
{
  "supabaseUrl": "your-actual-project-url",
  "supabaseAnonKey": "your-actual-anon-key",
  "openApiKey": "your-openai-api-key"
}
```

`openApiKey` powers the voice-assistant integration. Keeping it in the same file lets the launch configuration feed every runtime secret from one place.

2. The launch configuration automatically reads these values:
```json
{
  "configurations": [
    {
      "args": [
        "--dart-define=SUPABASE_URL=${command:extension.commandvariable.file.content:${workspaceFolder}/secrets/secrets.json:supabaseUrl}",
        "--dart-define=SUPABASE_ANON_KEY=${command:extension.commandvariable.file.content:${workspaceFolder}/secrets/secrets.json:supabaseAnonKey}",
        "--dart-define=OPENAI_API_KEY=${command:extension.commandvariable.file.content:${workspaceFolder}/secrets/secrets.json:openApiKey}"
      ]
    }
  ]
}
```

### 3. Accessing Configuration

In Dart code through EnvConfig:
```dart
class EnvConfig {
  static String get supabaseUrl => 
      const String.fromEnvironment('SUPABASE_URL');

  static String get supabaseAnonKey =>
      const String.fromEnvironment('SUPABASE_ANON_KEY');

  static String get openAiKey =>
      const String.fromEnvironment('OPENAI_API_KEY');
}
```

### 4. Security Benefits
- Secrets kept separate from application code
- No sensitive values in version control
- Clear documentation of required values
- Easy to manage different environments
- Secrets file properly gitignored

### 5. Directory Structure Benefits
- Secrets in dedicated directory
- Clear separation from app code
- Easier to manage access controls
- Consistent with other config files

### 6. CI/CD Setup
For CI/CD pipelines, provide values directly:
```bash
flutter build --dart-define=SUPABASE_URL=url --dart-define=SUPABASE_ANON_KEY=key
```

### 7. Production Deployment
For production:
1. Use CI/CD secrets management
2. Never commit production values
3. Consider platform-specific secret storage
4. Use different values per environment

### 8. Troubleshooting
Common issues:
1. Missing secrets.json: Create file in secrets directory
2. Wrong values: Check secrets.json content
3. VSCode not reading secrets: Verify extension installation
4. Build errors: Check all required values are defined

Remember: 
- Keep secrets.json in .gitignore
- Never commit actual values
- Keep this doc (or another versioned reference) updated with required keys
- Each developer maintains their own secrets file
