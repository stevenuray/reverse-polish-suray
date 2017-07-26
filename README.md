[![CircleCI](https://circleci.com/gh/stevenuray/reverse-polish-suray.svg?style=shield&circle-token=1ed061c4a080c416402b9a17b9d3d5bc9b11ad8a)](https://circleci.com/gh/stevenuray/reverse-polish-suray)

# reverse-polish-suray
Reverse Polish Calculator for On-Site

# Overview

# Technical Choices and Reasoning
## Architectural
## Trade-Offs
## CircleCI
CircleCI was used in this project for these reasons:
* To automatically verify this project worked on machines other than my development machine. 
* To automatically verify master has all of it's automated tests passing.
* To demonstrate some ability to work with modern CI/CD pipelines.

## Docker 
Docker was used in this project for these reasons:
* To attempt to make end user install and use as easy as possible.
* To make supporting a wide variety of user operating systems easier. 
* To reduce potential for conflict between a user's environment and a developer's environment.

This decision has the following disadvantages:
* Potentially unecessary complexity and functionality.
* Potential for a broken docker container but a working Ruby program, or vice versa. 

## Known Issues 
* This project was initially intended to be available as a Gem for other ruby projects to use, however this functionality was not completed and there are a number of currently useless files related to this, such as `gemspec`, `version.rb`, etc. 
* The `reverse/polish/suray/` file structure is currently overly nested, but is related to the initial goal of making the project available as a Gem.

# End-User Usage

## Install and Run

### Docker
Prerequisites:
* Docker

1. Enter `docker run -it stevenuray/reverse-polish-suray:latest` into a command line terminal.

### Without Docker
Prerequisites:
* Ruby
* Git

1. `git clone` this repository to an appropriate folder on your local machine.
2. At the root of this repo's folder on your machine, `bundle install`. 
3. Enter the `/bin/` directory of this repo with a command line tool. 
4. Enter `ruby rpn_suray` to run the program.

# Development Environment Setup
