library("rollama")

# https://github.com/JBGruber/rollama
# https://cran.r-project.org/web/packages/rollama/rollama.pdf

# check which ollama models you have installed
# this returns a tibble of all installed models
rollama::list_models()

# check if the LLM we want to use is installed
# if the model is installed, this function returns TRUE invisibily
# if the model is not installed, this function will ask if you want to install it
rollama::check_model_installed("mistral")

# check if the ollama server is running
# this function returns whcih ollama servers are running and their location
rollama::ping_ollama()

# query the LLM on the ollama server
question = "Q: What are large language models?"

# this function returns a list of the response from the LLM
# including some metadata about the response
# such as time it was created and the total duration
answer <- rollama::query(question, model = "mistral")

print(answer$message$content)

# note that there is also another function called `rollama::chat()`
# the difference is that chat treats new messages as part of the same conversation
# query sends a single question to the API without knowledge of previous questions
# rollama::chat(question, model = "mistral")
