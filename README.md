[![CircleCI](https://circleci.com/gh/stevenuray/reverse-polish-suray.svg?style=shield&circle-token=1ed061c4a080c416402b9a17b9d3d5bc9b11ad8a)](https://circleci.com/gh/stevenuray/reverse-polish-suray)

# reverse-polish-suray
Reverse Polish Calculator for On-Site

# Overview

# Technical Choices and Reasoning
## Architectural

### Language Choice
Ruby was used for the following reasons:
* Ruby was a shared language between myself and the On-Site development team. 
* The project was intended to be completed quickly, and therefore Ruby's dynamic typing, minimal syntax, and overall friendliness were complelling advantages in this context compared to a language like Java. 

### Operators as classes that include the Operator module
Advantages:
* Allows for additional operators by extension without modification.
* Allows for non default Ruby operators like `!` for factorial. 
* Allows for arbitrary association of symbols and mathmatical functions, for example `sqrt` could be mapped to `Math.sqrt`. 

Disadvantages:
* Unncessary complexity for basic `+, -, *, /` operators, and additional default Ruby operators like `**, %`. 

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
* Bundler

1. `git clone` this repository to an appropriate folder on your local machine.
2. At the root of this repo's folder on your machine, `bundle install`. 
3. Enter the `/bin/` directory of this repo with a command line tool. 
4. Enter `ruby rpn_suray` to run the program.

## Example Use

Addition, integer numbers:
`1 2 +`
`> 3`

Subtraction, decimal numbers:
`3.14 2 -`
`> 1.14`

Multiplication, negative numbers:
`-3 2 *`
`> -6`

Division, repeating decimal numbers.
`1 3 /`
`> 0.3333333333`

The answer from the last entry can also be used as the second number in the next entry. 

`1 2 +`
`> 3`
`2 -`
`- 1`

## Configuration

The following environment variables may be set by the user to override default settings:
*  `RPN_INPUT_SEPARATOR` is the separator between numbers and operators. For example, changing it to `","` would permit this entry `1,2,+`. Default value is `" "`.
*  `RPN_DECIMAL_PRECISION` is the maximum rounding precision for calculations. Default value is 10. 
*  `RPN_EXIT_COMMANDS` is a comma separated list of valid exit commands for the program. Default value is `q,exit`.

If you are using docker, remember that you need to pass in the environment variables to the container. An example: `docker run -it -e RPN_INPUT_SEPARATOR="," -e RPN_DECIMAL_PRECISION=5 -e RPN_EXIT_COMMANDS="q,quit,exit" stevenuray/reverse-polish-suray:latest`.

# Developer Usage

## Running Tests
At the repo's root folder on your local machine: `rspec`.
Remember to ensure any environment variables you set to configure the application are unset when testing!

## Creating/Use Development Docker Image
At the repo's root folder on your local machine:
1. Build image with: `docker build -t 'rpn_development:latest' .`
2. Run image with: `docker run -it rpn_development:latest`
