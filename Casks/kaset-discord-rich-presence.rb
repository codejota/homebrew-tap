cask "kaset-discord-rich-presence" do
  version "1.0.0"
  sha256 "611c31132ca6a8aab36dbcec6f36f3749b12ca1682706db64a7be7494cf68172"

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
