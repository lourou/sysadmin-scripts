# Send login notification to Pushover
# This goes into /etc/profile
# Originally from https://gist.github.com/da-n/6326007
if [ -n "$SSH_CLIENT" ]; then
  TEXT="$(date): SSH login to ${USER}@$(hostname -f)"
  TEXT="$TEXT from $(echo $SSH_CLIENT|awk '{print $1}')"

  ## Send to pushover
  curl -s \
  -F "token=API_TOKEN" \
  -F "user=API_USER" \
  -F "message=$TEXT" \
  https://api.pushover.net/1/messages.json >/dev/null 2>&1
fi
