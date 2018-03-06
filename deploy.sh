#!/bin/bash
#set -e

if [ "$TRAVIS_TAG" =~ "^release.*$" or "$TRAVIS_TAG" =~ "^R\d\.\d.*$" AND "$TRAVIC_BRANCH" = "dev-r33_cc1101"]
  then
    curl --location "https://github.com/tfausak/github-release/releases/download/0.1.8/github-release-1.1.4-$TRAVIS_OS_NAME.gz" > github-release.gz
    gunzip github-release.gz
    ./github-release upload \
      --token "$GH_API_KEY" \
      --owner Sidey79 \
      --repo RFD-FHEM/SIGNALDuino \
      --tag "$TRAVIS_TAG" \
      --file "$PWD/release/SIGNALDuino_${BOARD}${RECEIVER}${TRAVIS_TAG}.hex" \
      --name "SIGNALDuino_${BOARD}${RECEIVER}${TRAVIS_TAG}"
  fi
  
if [ "$TRAVIS_TAG" =~ "^nightly.*$" ]
  then
    DATE=`date +%Y-%m-%d`
    curl --location "https://github.com/tfausak/github-release/releases/download/0.1.8/github-release-1.1.4-$TRAVIS_OS_NAME.gz" > github-release.gz
    gunzip github-release.gz
    ./github-release upload \
      --token "$GH_API_KEY" \
      --owner Sidey79 \
      --repo RFD-FHEM/SIGNALDuino \
      --tag "$TRAVIS_TAG" \
      --file "$PWD/release/SIGNALDuino_${BOARD}${RECEIVER}${TRAVIS_TAG}.hex" \
      --name "nightly-SIGNALDuino_${BOARD}${RECEIVER}${DATE}"
  fi