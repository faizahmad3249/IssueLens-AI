# IssueLens AI: Local setup and cloud deployment

## A. One-click local setup (Windows)

1. Install Python 3.10+ from https://www.python.org/downloads/ and enable **Add Python to PATH**.
2. Install Ollama from https://ollama.com/download if you want local AI.
3. Download/clone this repository.
4. Double-click `setup.bat` once. It creates `.venv`, installs `requirements.txt`, and attempts to download `gemma3:4b` when Ollama is installed.
5. Double-click `run.bat` whenever you want to start the app.
6. In the app sidebar, choose **Local Ollama** for local inference or **Cloud Gemini** for hosted inference.

Python packages are installed once per project folder. Ollama and the Gemma model are separate system-level requirements and are not bundled into the repository. The Gemma model download is several GB; available disk space and internet are required.

### Use Gemini locally (without Ollama)

Create a Gemini API key at https://aistudio.google.com/apikey. Set it in PowerShell before starting the app:

```powershell
$env:GEMINI_API_KEY="YOUR_KEY"
.un.bat
```

Alternatively, create `.streamlit/secrets.toml` based on `.streamlit/secrets.toml.example`. Do not commit the real secrets file.

## B. Deploy to Streamlit Community Cloud

1. Push this branch to GitHub and create a pull request into `main` after testing.
2. Open https://share.streamlit.io/ and sign in with GitHub.
3. Choose **Create app**, select this repository and the branch containing these changes.
4. Set the main file path to `app.py`.
5. In the app's **Advanced settings / Secrets**, add:

```toml
GEMINI_API_KEY = "YOUR_REAL_GEMINI_API_KEY"
```

6. Deploy. In the app sidebar, choose **Cloud Gemini**.

The cloud deployment does not need Ollama or a local Gemma model. GitHub issue/repository data is fetched from GitHub's public REST API. Gemini API usage, quotas, and billing depend on the Google AI Studio account and current terms.

## Configuration and security

- Never put API keys in source code, commit history, screenshots, or public files.
- `.streamlit/secrets.toml` is ignored by Git.
- Cloud Gemini mode uses the Gemini API; local Ollama mode continues to use `gemma3:4b`.
- The app sends issue text and selected public source excerpts to the selected AI provider for analysis. Do not submit private repository data unless you are authorized to share it with that provider.

## Troubleshooting

- If PowerShell blocks virtual-environment activation, no activation is needed by these batch files: they call the virtual environment's Python directly.
- If Python is not found, reinstall Python and enable **Add Python to PATH**, then reopen the terminal.
- If local mode cannot connect, open Ollama and check `ollama list`.
- If Gemma is missing, run `ollama pull gemma3:4b`.
- If Gemini mode reports a missing key, add `GEMINI_API_KEY` to Streamlit secrets or the environment and restart the app.
