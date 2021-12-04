#!/usr/bin/env bash
# if .env file doesn't exist, create it from the example

if [[ ! -f .env ]] ; then
  cp env.example .env
fi
