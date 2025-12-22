#!/bin/bash

# 1. Default model
SELECTED_MODEL="meta-llama/llama-3.1-8b-instruct:free"

# 2. Argument logic
if [[ "$1" != "" ]]; then
    case $1 in
        mistral|-m|--mistral) SELECTED_MODEL="mistralai/mistral-7b-instruct:free" ;;
        nano |-n|--nano)    SELECTED_MODEL="nvidia/nemotron-nano-12b-v2-vl:free" ;;
        llama|-l|--llama)   SELECTED_MODEL="meta-llama/llama-3.3-70b-instruct:free" ;;
        gemma|-g|--gemma)   SELECTED_MODEL="google/gemma-3-4b-it:free" ;;
        *)                  SELECTED_MODEL="$1" ;;
    esac
fi

# 3. Corrected Curl Call
curl -s https://openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d "{
  \"model\": \"$SELECTED_MODEL\",
  \"messages\": [
    {
      \"role\": \"user\",
      \"content\": \"Answer this question the way a human might: 'The sky is ...'\"
    }
  ]
}"
