#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git

git clone https://github.com/agvwall/SetupScript

chmod +X SetupScript/SecondScript

cd SecondScript

./SecondScript