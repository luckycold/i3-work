#!/bin/bash

# Define the workspace and application
WORKSPACE="4"
APP_CLASS="WebApp-MicrosoftTeams3084"
APP_COMMAND="firefox"
APP_ARGS="--class WebApp-MicrosoftTeams3084 --profile /home/lucky/.local/share/ice/firefox/MicrosoftTeams3084 --no-remote https://teams.microsoft.com/v2/"
APP_FULL_COMMAND="XAPP_FORCE_GTKWINDOW_ICON='/home/lucky/.local/share/ice/icons/MicrosoftTeams.png' $APP_COMMAND $APP_ARGS"

# Check if the application is already running
if ! pgrep -f "$APP_COMMAND.*$APP_ARGS" > /dev/null; then
    # Switch to the workspace
    i3-msg workspace "$WORKSPACE"
    
    # Launch the application
    sh -c "$APP_FULL_COMMAND" &
else
    # Switch to the workspace where the application is running
    i3-msg [class="$APP_CLASS"] focus
fi

