cask "insomnia-classic" do
  version "2023.5.8"
  sha256 "40c640dcb17bc9d3a66e2afc82c28fac4c78f92aaccf72c4aea14fdfd984847f"

  url "https://github.com/Kong/insomnia/releases/download/core%40#{version}/Insomnia.Core-#{version}.dmg",
      verified: "github.com/Kong/insomnia/"
  name "Insomnia"
  desc "HTTP and GraphQL Client"
  homepage "https://insomnia.rest/"

  # Intentionally pinned. This cask exists specifically to avoid the changes
  # introduced from 8.0.0 onward (mandatory login, tab-based UI, revamped
  # collections, built-in AI features). Do not autobump.
  livecheck do
    skip "pinned intentionally to the last pre-8.0.0 release"
  end

  # `auto_updates true` also makes bare `brew upgrade` skip this cask
  # (only `--greedy` would touch it), on top of `version`/`sha256` never
  # changing unless this file is edited by hand.
  auto_updates true
  conflicts_with cask: ["insomnia", "insomnia@alpha"]
  depends_on macos: :monterey

  app "Insomnia.app"

  caveats <<~EOS
    This cask installs Insomnia pinned to version #{version}, the last
    release before the 8.0.0 redesign.

    Insomnia ships its own built-in auto-updater (independent of Homebrew).
    To avoid being silently updated to a newer version, after installing go
    to:

      Preferences → General → uncheck "Automatically update"

    If you already have the "insomnia" (latest version) cask installed,
    uninstall it first (they conflict since both use /Applications/Insomnia.app):

      brew uninstall --cask insomnia
  EOS

  zap trash: [
    "~/Library/Application Support/Insomnia",
    "~/Library/Caches/com.insomnia.app",
    "~/Library/Caches/com.insomnia.app.ShipIt",
    "~/Library/Cookies/com.insomnia.app.binarycookies",
    "~/Library/Preferences/ByHost/com.insomnia.app.ShipIt.*.plist",
    "~/Library/Preferences/com.insomnia.app.helper.plist",
    "~/Library/Preferences/com.insomnia.app.plist",
    "~/Library/Saved Application State/com.insomnia.app.savedState",
  ]
end
