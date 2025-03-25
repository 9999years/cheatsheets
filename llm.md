# Large language models

Use Ollama (`brew install ollama`) for running LLMs locally: <https://ollama.com/>

- `ollama list`
- `ollama pull MODEL_NAME`
- `ollama run MODEL_NAME`
- `ollama serve`: Start a server, needed to run models
  - `brew services start ollama` for Homebrew


## Ollama commands

In an `ollama run` session...
- `/clear` to clear the current session context (previous messages)
- `/set system PROMPT` to set the system prompt
- `/set parameter` to show available parameters like `temperature`
- `/set parameter temperature 2.0` to make things sillier

Info, debugging:
- `/show info` to show model size, context length, system prompt
- `/set verbose` to get statistics:

    >>> hello
    Hello! How can I assist you today?

    total duration:       341.256875ms
    load duration:        29.0055ms
    prompt eval count:    159 token(s)
    prompt eval duration: 115.899792ms
    prompt eval rate:     1371.87 tokens/s
    eval count:           10 token(s)
    eval duration:        193.027375ms
    eval rate:            51.81 tokens/s


## Programmatic use

For quick scripting, `ollama run` takes input on stdin:

    $ echo "hello, world!" | ollama run qwen2.5-coder:latest
    Hello! How can I assist you today?


## Choosing models

Which models can you run locally (and how fast) with given specs: <https://www.caniusellm.com/>

Popular models (December 2024): <https://abishekmuthian.com/how-i-run-llms-locally/>

-	Llama3.2 for Smart Connections and generic queries: <https://ollama.com/library/llama3.2>
-	Deepseek-coder-v2 for code completion in Continue: <https://ollama.com/library/deepseek-coder-v2>
-	Qwen2.5-coder for chatting about code in Continue: <https://ollama.com/library/qwen2.5-coder>
