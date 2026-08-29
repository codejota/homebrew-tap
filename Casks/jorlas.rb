require "digest"
require "fileutils"

cask "jorlas" do
  version "0.4.21"
  sha256 "71b88e8773d580f745a02fb0052fec9783043ca814d6d7b8dcc9e69c6b7a8307"

  url "https://raw.githubusercontent.com/codejota/homebrew-tap/main/bootstrap/jorlas.txt"
  name "Jorlas"
  desc "Native macOS control desk and menu bar toolkit"
  homepage "https://github.com/codejota/jorlas"

  depends_on formula: "gh"
  depends_on macos: :sonoma

  container type: :naked

  preflight do
    gh = ["/opt/homebrew/bin/gh", "/usr/local/bin/gh", "/usr/bin/gh"].find { |path| File.executable?(path) }
    raise "GitHub CLI is required to install private Jorlas releases." unless gh

    unless system(gh, "auth", "status", "--hostname", "github.com", out: File::NULL, err: File::NULL)
      raise "Jorlas is private. Run: gh auth login"
    end

    dmg = staged_path/"Jorlas-#{version}.dmg"
    FileUtils.rm_f(dmg)
    ok = system(
      gh,
      "release", "download", "v#{version}",
      "--repo", "codejota/jorlas",
      "--pattern", "Jorlas-#{version}.dmg",
      "--output", dmg.to_s,
    )
    raise "Could not download the private Jorlas release. Confirm that gh is logged in as an account with access to codejota/jorlas." unless ok && dmg.exist?

    actual_sha = Digest::SHA256.file(dmg).hexdigest
    expected_sha = "ab54d5d286a4f8e4fd46af883fdc5f03774dc505e7e45d9b52866c19b0341355"
    raise "Jorlas DMG checksum mismatch." unless actual_sha == expected_sha

    mount = staged_path/"jorlas-private-release"
    FileUtils.rm_rf(mount)
    FileUtils.mkdir_p(mount)

    begin
      attached = system(
        "/usr/bin/hdiutil", "attach", dmg.to_s,
        "-nobrowse", "-readonly", "-mountpoint", mount.to_s,
        out: File::NULL,
      )
      raise "Could not mount the Jorlas DMG." unless attached

      source_app = mount/"Jorlas.app"
      raise "Jorlas.app was not found inside the private release DMG." unless source_app.exist?
      FileUtils.rm_rf(staged_path/"Jorlas.app")
      FileUtils.cp_r(source_app, staged_path/"Jorlas.app", preserve: true)
    ensure
      system("/usr/bin/hdiutil", "detach", mount.to_s, "-quiet") if mount.exist?
      FileUtils.rm_rf(mount)
      FileUtils.rm_f(dmg)
    end
  end

  app "Jorlas.app"

  uninstall quit: "com.jorlas.app"

  zap trash: [
    "~/Library/Application Support/com.jorlas.app",
    "~/Library/Caches/com.jorlas.app",
    "~/Library/Preferences/com.jorlas.app.plist",
  ]
end
