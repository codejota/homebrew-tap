cask "jorlas" do
  version "0.5.6"
  sha256 "ba82e44d808d439ce3d02489566ec45f888d1ffd0b010ff6740f9beb8a5ba886"

  url "https://raw.githubusercontent.com/codejota/homebrew-tap/main/bootstrap/jorlas-0.5.6-installer.tar.gz"
  name "Jorlas"
  desc "Native macOS control desk and menu bar toolkit"
  homepage "https://github.com/codejota/jorlas"

  depends_on formula: "gh"
  depends_on macos: :sonoma

  installer script: {
    executable: "install.sh",
  }

  uninstall quit: "com.jorlas.app",
            delete: "/Applications/Jorlas.app"

  zap trash: [
    "~/Library/Application Support/com.jorlas.app",
    "~/Library/Caches/com.jorlas.app",
    "~/Library/Preferences/com.jorlas.app.plist",
  ]
end
