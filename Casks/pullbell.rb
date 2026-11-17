cask "pullbell" do
  version "0.1.1"
  sha256 "499943b9b9427d5b4695113a3ce286858cf18a49cfa9033dec26c4565965f88a"

  url "https://github.com/aaronsuns/pullbell/releases/download/v#{version}/Pullbell_#{version}_universal.dmg"
  name "Pullbell"
  desc "GitHub inbox in the menu bar that rings only for what needs you"
  homepage "https://pullbell.zexa.se"

  depends_on macos: ">= :ventura"

  app "Pullbell.app"

  # Signed but not notarized: clear the quarantine flag so it opens on first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Pullbell.app"]
  end

  zap trash: [
    "~/Library/Application Support/se.zexa.pullbell",
    "~/Library/Logs/Pullbell",
  ]
end
