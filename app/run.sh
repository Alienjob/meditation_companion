#!/bin/bash

# Load secrets from JSON
SECRETS_FILE="../secrets/secrets.json"

if [ ! -f "$SECRETS_FILE" ]; then
    echo "Error: secrets.json not found at $SECRETS_FILE"
    exit 1
fi

SUPABASE_URL=$(jq -r '.supabaseUrl' "$SECRETS_FILE")
SUPABASE_ANON_KEY=$(jq -r '.supabaseAnonKey' "$SECRETS_FILE")
OPENAI_API_KEY=$(jq -r '.openApiKey' "$SECRETS_FILE")

echo "Starting Flutter app with environment variables..."

flutter run -d chrome \
  --dart-define=SUPABASE_URL="$SUPABASE_URL" \
  --dart-define=SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY" \
  --dart-define=OPENAI_API_KEY="$OPENAI_API_KEY"
