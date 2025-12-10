#!/bin/bash

# Load secrets from JSON
SECRETS_FILE="../secrets/secrets.json"

if [ ! -f "$SECRETS_FILE" ]; then
    echo "Error: secrets.json not found at $SECRETS_FILE"
    exit 1
fi

# Use local Supabase instance
LOCAL_SUPABASE_URL=$(jq -r '.localSupabaseUrl' "$SECRETS_FILE")
LOCAL_SUPABASE_ANON_KEY=$(jq -r '.localSupabaseAnonKey' "$SECRETS_FILE")
OPENAI_API_KEY=$(jq -r '.openApiKey' "$SECRETS_FILE")

echo "Starting Flutter app with LOCAL Supabase environment..."
echo "Supabase URL: $LOCAL_SUPABASE_URL"

flutter run -d chrome \
  --dart-define=SUPABASE_URL="$LOCAL_SUPABASE_URL" \
  --dart-define=SUPABASE_ANON_KEY="$LOCAL_SUPABASE_ANON_KEY" \
  --dart-define=OPENAI_API_KEY="$OPENAI_API_KEY"
