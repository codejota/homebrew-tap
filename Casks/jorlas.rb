cask "jorlas" do
  version "0.4.17"
  sha256 "ecd8be92c89a4f84c7142838ad625e70e3174bbebcfb3387c6d3a09118fc2526"

  github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"].to_s.strip
  if github_token.empty?
    gh = ["/opt/homebrew/bin/gh", "/usr/local/bin/gh", "/usr/bin/gh"].find { |path| File.executable?(path) }
    github_token = IO.popen([gh, "auth", "token", "--hostname", "github.com"], err: File::NULL, &:read).strip if gh
  end
  raise "Jorlas is private. Authenticate GitHub CLI with an account that can access codejota/jorlas: gh auth login" if github_token.empty?

  url "https://github.com/codejota/jorlas/releases/download/v#{version}/Jorlas-#{version}.dmg",
      header: "Authorization: Bearer #{github_token}"
  name "Jorlas"
  desc "Native macOS control desk and menu bar toolkit"
  homepage "https://github.com/codejota/jorlas"

  depends_on macos: ">= :sonoma"
  app "Jorlas.app"

  uninstall quit: "com.jorlas.app"

  zap trash: [
    "~/Library/Application Support/com.jorlas.app",
    "~/Library/Caches/com.jorlas.app",
    "~/Library/Preferences/com.jorlas.app.plist",
  ]
end
