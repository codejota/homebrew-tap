cask "jorlas" do
  version "0.4.59"
  sha256 "226994a6ef657933f41003a0e28c05beda681fbad87b06d25054cbe8c553812c"

  url "https://raw.githubusercontent.com/codejota/homebrew-tap/main/bootstrap/jorlas-0.4.59-installer.tar.gz"
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
