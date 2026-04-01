cask "grove" do
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-arm64.zip"
    sha256 "8206dafc290253b2d65796430e5b3c5af765ee4b2adca07837d604b5858aa9f2"
  else
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-x64.zip"
    sha256 "PLACEHOLDER_X64_SHA256"
  end

  no_quarantine true

  name "Grove"
  desc "Git worktree launcher — pick a branch, open it in your IDE"
  homepage "https://github.com/ljwh1231/grove"

  app "Grove.app"

  zap trash: [
    "~/Library/Application Support/grove",
    "~/Library/Preferences/com.grove.app.plist",
    "~/Library/Caches/com.grove.app",
  ]
end
