import requests

url = "http://localhost:11434/api/chat"

payload = {
    "model": "gemma3:4b",
    "messages": [
        {
            "role": "user",
            "content": (
                "Explain a GitHub issue to a beginner "
                "in three sentences."
            )
        }
    ],
    "stream": False
}

try:
    response = requests.post(
        url,
        json=payload,
        timeout=180
    )

    response.raise_for_status()

    result = response.json()

    print("\nMODEL:", result.get("model"))
    print("\nAI RESPONSE:")
    print(result["message"]["content"])

except requests.exceptions.ConnectionError:
    print("ERROR: Ollama is not running.")

except requests.exceptions.Timeout:
    print("ERROR: The model took too long to respond.")

except requests.exceptions.RequestException as error:
    print("API ERROR:", error)