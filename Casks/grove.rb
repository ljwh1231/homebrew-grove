cask "grove" do
  version "0.1.4"

  if Hardware::CPU.arm?
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-arm64.zip"
    sha256 "49e19e15a5f650fa0b7c4b26144335410936a1a686ada41e93c806cf5bf1b5a4"
  else
    url "https://github.com/ljwh1231/grove/releases/download/v#{version}/Grove-#{version}-x64.zip"
    sha256 "41a1488bf9b544a4261d59be8dd26aeecbd5870427f6689a1b49fcbc2bb18118"
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
