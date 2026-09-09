cask "jorlas" do
  version "0.4.57"
  sha256 "59621eb1cbfa8d5864badffd450038ddd938fc0cae8495351b1f46a64cc378c5"

  url "https://raw.githubusercontent.com/codejota/homebrew-tap/main/bootstrap/jorlas-0.4.57-installer.tar.gz"
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
