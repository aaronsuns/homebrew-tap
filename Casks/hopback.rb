cask "hopback" do
  version "0.1.1"
  sha256 "c69770ed0ebe1c81aa327ed8d1253237f682b61449ecf0a07d90bf0cadfcfecf"

  url "https://github.com/aaronsuns/hopback/releases/download/v#{version}/Hopback.dmg"
  name "Hopback"
  desc "Claude Code session switcher and notifier for VS Code in the menu bar"
  homepage "https://hopback.zexa.se"

  depends_on macos: ">= :ventura"

  app "Hopback.app"

  # Not notarized: clear the quarantine flag so it opens on first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Hopback.app"]
  end

  zap trash: "~/.claude/hopback"
end
