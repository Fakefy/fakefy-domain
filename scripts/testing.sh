#!/bin/zsh

# Exit on error
set -eo pipefail

SCHEME='TouchTunes Domain'
WORKSPACE='TouchTunes Domain.xcworkspace'

DESTINATION='platform=iOS Simulator,name=iPhone 12,OS=14.4'

# 1 - Check for xcpretty
echo "Checking for xcpretty installation..."
if ! gem list -i "^xcpretty$" ; then
    echo "Looks like you don't have the xcpretty installed, lets fix that!"
    echo "Running: sudo gem install xcpretty"
    sudo gem install xcpretty
    echo "xcpretty installed!"
fi

# 2 - Run pod install
pod install

# 3 - Run unit tests
xcodebuild test -workspace $WORKSPACE -scheme $SCHEME -destination $DESTINATION | xcpretty