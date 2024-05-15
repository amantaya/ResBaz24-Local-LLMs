library("rollama")
library("arrow")
library("glue")
library("tidyverse")

# We will be classifying movie reviews from rotten tomatoes as either positive or negative

# we will be taking a random sample, so we set the seed for reproducibility
set.seed(1)

# Load the Movie Reviews Dataset -------------------------------------

# Dataset Credit: https://huggingface.co/datasets/rotten_tomatoes
# load the parquet dataset using the `arrow` R package
movie_reviews <- arrow::read_parquet(
  file.path("data",
            "train.parquet")
  )

# view the structure of the dataset
dplyr::glimpse(movie_reviews)

# the dataset has 8,530 rows and 2 columns
# the `text` column contains the movie review
# the `label` column contains the sentiment of the review, where 1 is positive and 0 is negative 
# this is a crowdsourced dataset, so the sentiment may not be accurate

# Sample 5 Movie Reviews to Classify -------------------------------------

# for the sake of time for this workshop
# we will take a sample of 5 rows to classify with the LLM
sample_reviews <- movie_reviews %>% 
  dplyr::slice_sample(n = 5)

print(sample_reviews)

# Classify a Single Movie Review with LLM -------------------------------------

# query the LLM on the ollama server using a string template for the first review
prompt = glue::glue(
"Instructions: Classify this movie review as either 'positive' or 'negative'.
Text: {sample_reviews$text[1]}"
)

# let's use the LLM model "llama3" for this example
# the `rollama query` function will print the model's response in the console
answer <- rollama::query(prompt, model = "llama3")

# Classify All Movie Reviews with LLM -------------------------------------

# create a new column to store the LLM response
sample_reviews$llm_response <- NA_character_

for (i in 1:nrow(sample_reviews)) {
  
  prompt <- glue::glue(
    "Instructions: Classify this movie review as either 'positive' or 'negative'.
    Text: {sample_reviews$text[i]}"
  )

  answer <- rollama::query(prompt, model = "llama3", screen = FALSE)

  sample_reviews$llm_response[i] <- answer$message$content
}

View(sample_reviews)

sample_reviews <- sample_reviews %>%
  dplyr::mutate(
    llm_sentiment = stringr::str_extract(llm_response, "positive|negative"),
    llm_score = dplyr::if_else(llm_sentiment == "positive", 1, 0)
  )

# create a model performance score where we compare 
# the labeled score (crowdsourced by humans) with the LLMs score
model_performance <- sample_reviews %>%
  dplyr::summarize(
    accuracy = mean(label == llm_score)
  )
