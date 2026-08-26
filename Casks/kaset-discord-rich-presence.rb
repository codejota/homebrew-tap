cask "kaset-discord-rich-presence" do
  version "1.0.1"
  sha256 "3c1f6cfa0e3294dffbaff22b4d90fe1757a5b5a9b4919075a64d86f37da86b80"

  url "https://github.com/codejota/kaset-discord-rich-presence/releases/download/v#{version}/kaset-v#{version}.dmg"
  name "Kaset Discord Rich Presence"
  desc "Kaset with Discord Rich Presence"
  homepage "https://github.com/codejota/kaset-discord-rich-presence"

  auto_updates false
  depends_on macos: :sequoia

  app "Kaset.app", target: "Kaset Discord.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Kaset Discord.app"], sudo: false
  end

  zap trash: [
    "~/Library/Containers/com.codejota.KasetDiscord",
    "~/Library/Caches/com.codejota.KasetDiscord",
    "~/Library/Preferences/com.codejota.KasetDiscord.plist",
    "~/Library/Saved Application State/com.codejota.KasetDiscord.savedState",
    "~/Library/WebKit/com.codejota.KasetDiscord",
  ]
end
