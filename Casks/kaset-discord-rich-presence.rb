cask "kaset-discord-rich-presence" do
  version "main"
  sha256 "2a7862162c78651d8fc3db3ab10ab92e7a20f13ae3a48ae1290fe7397dc195e6"

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
