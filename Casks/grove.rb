cask "grove" do
  version "0.1.3"

  if Hardware::CPU.arm?
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-arm64.zip"
    sha256 "a437abf7ccdab4d409652971273daf52803e02e601fb266d2c23d6b6eabbf5a0"
  else
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-x64.zip"
    sha256 "PLACEHOLDER_X64_SHA256"
  end

  name "Grove"
  desc "Git worktree launcher — pick a branch, open it in your IDE"
  homepage "https://github.com/ljwh1231/grove"

  app "Grove.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Grove.app"]
  end

  zap trash: [
    "~/Library/Application Support/grove",
    "~/Library/Preferences/com.grove.app.plist",
    "~/Library/Caches/com.grove.app",
  ]
end
