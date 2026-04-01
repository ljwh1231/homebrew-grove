cask "grove" do
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-arm64.zip"
    sha256 "7ed9a1e56257c3df31a9780e7cbb2e0c8f15226fed34a7de63640afd60ff0fb8"
  else
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-x64.zip"
    sha256 "PLACEHOLDER_X64_SHA256"
  end

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
