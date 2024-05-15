# Introduction to Running Large Language Models Locally

[![pages-build-deployment](https://github.com/amantaya/ResBaz24-Local-LLMs/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/amantaya/ResBaz24-Local-LLMs/actions/workflows/pages/pages-build-deployment)

**Ironically, some of the content in this workshop is generated using
large language models (i.e., GitHub CoPilot). Where possible, I have
tried to verify the information from an outside source and *hopefully*
they didn't get their information from a large language model. All
mistakes are my own.**

This workshop will introduce you to running large language models (LLMs)
on your local machine.

We will cover the following topics in this workshop:

-   What are large language models?
-   Why are they a hot topic?
-   What are the different types of large language models?
-   How to select a LLM for your project
-   How to run them on your local machine
-   How to use them in your projects programmatically through an API -
    Locally!

## Schedule

| Time        | Duration | Topic                                                 |
|-------------|----------|-------------------------------------------------------|
| 0:00 - 0:15 | 15 Min   | Introduction to Large Language Models                 |
| 0:15 - 0:25 | 10 Min   | Selecting a Large Language Model                      |
| 0:25 - 0:30 | 5 Min    | 5 Minute Break                                        |
| 0:30 - 0:45 | 15 Min   | Running Large Language Models Locally                 |
| 0:45 - 1:30 | 45 Min   | Using LLMs Programmatically through an API - Locally! |

## Slides

[Introduction to Large Language
Models](https://amantaya.github.io/ResBaz24-Local-LLMs)

## Setup

We will be using `ollama` which is a free to use program that allows you
to run large language models on your local machine. You can download it
from [here](https://ollama.com).

`ollama` is a command line tool that allows you to download and run LLMs
locally on your machine. It is great tool for an introduction to LLMs
because it greatly simplifies the process of running LLMs on your local
machine as `ollama` handles the downloading, installation, and running
of LLMs for you.

Additionally, `ollama` runs LLMs on your machine with an Application
Programming Interface (API) already built into each model. This means
that you can use LLMs in your projects programmatically, through a
programming language like R or Python. This simplifies the process of
using LLMs for your projects.

`ollama` uses the graphics processing unit (GPU) on your machine to run
LLMs. This can take a long time to run, especially if you have an older
machine and/or a weaker GPU.

## Additional Resources

-   [HuggingFace](https://huggingface.co/) - a huge collection of all
    types of AI models.
