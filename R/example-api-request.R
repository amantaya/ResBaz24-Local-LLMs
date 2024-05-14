library("httr2")
library("httpuv")
library("jsonlite")
library("stringr")

# location of the LLM API on your local machine
url <- "http://localhost:11434/api/generate"

# model name
model <- "mistral"

# prompt
prompt <- "Q: What are large language models?"

# construct a request to send to the LLM API
request <- httr2::request(url) %>% 
  httr2::req_method("POST") %>%
  httr2::req_body_json(list(model = model, prompt = prompt))

# print the response to check if it's properly formatted
httr2::req_dry_run(request)

# Send the request to the LLM API
# This may take awhile
response <- httr2::req_perform(request)

# check if the response has a body
httr2::resp_has_body(response)

# save the response body as a string
# the response body are multiple JSON objects separated by the newline character
response_body <- httr2::resp_body_string(response)

# break the response into a list of JSON objects by the newline character
json_list <- stringr::str_split(response_body, "\n")



# the response returns multiple JSON object, so we can use the jsonlite package to convert it to a R object
jsonlite::fromJSON(json_list[1][1])
