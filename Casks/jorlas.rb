cask "jorlas" do
  version "0.4.67"
  sha256 "a52862ccb16ccf10a5413d91d750242df406c926da309723cfbd3faa059a8e8e"

  url "https://raw.githubusercontent.com/codejota/homebrew-tap/main/bootstrap/jorlas-0.4.67-installer.tar.gz"
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
