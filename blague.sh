#!/bin/bash

#https://api.chucknorris.io/jokes/random



blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r ".value")
