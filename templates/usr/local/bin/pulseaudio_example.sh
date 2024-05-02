#!/bin/bash

# Set default sink volume for user
potos_pulseaudio_defsink=$( pactl info | awk '/Default Sink:/ {print $3}' )
pactl set-sink-mute $potos_pulseaudio_defsink 0 # Make sure its unmuted
pactl set-sink-volume $potos_pulseaudio_defsink "{{ potos_pulseaudio_default_volume }}"
