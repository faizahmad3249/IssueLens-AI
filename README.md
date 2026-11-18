# IssueLens AI

### Make sense of the issue.

IssueLens AI is an open-source contribution assistant that helps developers understand GitHub issues and plan their first contribution.

It uses a local Gemma model through Ollama to generate beginner-friendly explanations and investigation plans.

## Features

- Fetch public GitHub issue details
- Inspect repository file paths
- Retrieve selected source-code excerpts
- Generate an AI-assisted contribution plan
- Suggest investigation steps and test cases
- Support English and Hindi output
- Download contribution notes as Markdown
- Use Gemma locally through Ollama

## Tech Stack

- Python
- Streamlit
- GitHub REST API
- Ollama
- Gemma 3 4B

## Requirements

- Python 3.10 or later
- Git
- Ollama
- Gemma 3 4B model
- Internet connection for GitHub data

## Installation

Clone the repository:

```bash
git clone https://github.com/faizahmad3249/IssueLens-AI.git
cd IssueLens-AI

## Run locally with one click (Windows)

- Run `setup.bat` once to create the virtual environment and install Python packages.
- Run `run.bat` whenever you want to launch IssueLens.
- Local AI requires Ollama and the `gemma3:4b` model. Cloud Gemini mode does not require Ollama.

## Cloud deployment

IssueLens supports Google Gemini API for cloud inference. Deploy the Streamlit app using the instructions in [DEPLOYMENT.md](DEPLOYMENT.md), then add `GEMINI_API_KEY` in Streamlit Community Cloud app secrets.

See [DEPLOYMENT.md](DEPLOYMENT.md) for complete setup, configuration, and troubleshooting instructions.
