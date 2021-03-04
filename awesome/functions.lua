function twitch_stream()
  channel = io.read() -- twitch_stream("varsitygaming")
  return os.execute("streamlink --twitch-low-latency " .. "https://www.twitch.tv/" .. channel .. " best")
end
