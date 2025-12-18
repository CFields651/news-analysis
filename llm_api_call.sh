#!/bin/bash

# 1. Default model
SELECTED_MODEL="meta-llama/llama-3.1-8b-instruct:free"

# 2. Argument logic
if [[ "$1" != "" ]]; then
    case $1 in
        mistral|-m|--mistral) SELECTED_MODEL="mistralai/mistral-7b-instruct:free" ;;
        llama|-l|--llama)   SELECTED_MODEL="meta-llama/llama-3.3-70b-instruct:free" ;;
        gemma|-g|--gemma)   SELECTED_MODEL="google/gemma-3-4b-it:free" ;;
        *)                  SELECTED_MODEL="$1" ;;
    esac
fi

# 3. Use -s (silent) so curl doesn't print progress bars to the pipe
# We also avoid 'echo' so the output is pure JSON
curl -s https://openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d "{
  \"model\": \"$SELECTED_MODEL\",
  \"messages\": [
    {
      \"role\": \"user\",
      \"content\": \"Sort the following list in descending order. Don't give any additional text or explanation: 10, 15, 22, 13, 12, 1\"
    }
  ]
}"
