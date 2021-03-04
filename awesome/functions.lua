function twitch_stream()
  channel = io.read() -- twitch_stream("varsitygaming")
  return os.execute("streamlink --twitch-low-latency " .. "https://www.twitch.tv/" .. channel .. " best")
end

-- two versions

abyss = " >/dev/null 2>&1 &"

function interactive_launch()
  input = io.read()
  os.execute("google-chrome --app=https://" .. input .. abyss)
end

function launch(url)
  os.execute("google-chrome --app=https://" .. url .. abyss)
end

-- launch("twitch.tv/varsitygaming")
