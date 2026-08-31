cask "jorlas" do
  version "0.4.34"
  sha256 "2c07b32a1585908240c92cdef37735cefc9536e0708cf172344df685cbd3ec06"

  url "https://raw.githubusercontent.com/codejota/homebrew-tap/main/bootstrap/jorlas-0.4.34-installer.tar.gz"
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
