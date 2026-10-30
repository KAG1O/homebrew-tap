cask "dynamicbar" do
  version "1.1"
  sha256 "39a24b33532a4762d85840eb5bf6dd296bf3787d218b45b92677c8efcd41ab66"

  url "https://github.com/KAG1O/DynamicBar/releases/download/v#{version}/DynamicBar.dmg"
  name "DynamicBar"
  desc "Liquid Glass island for the notch"
  homepage "https://kag1o.github.io/DynamicBar/"

  livecheck do
    url "https://kag1o.github.io/DynamicBar/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "DynamicBar.app"

  uninstall quit: "com.DynamicBar"

  zap trash: [
    "~/Library/Application Support/DynamicBar",
    "~/Library/Caches/com.DynamicBar",
    "~/Library/HTTPStorages/com.DynamicBar",
    "~/Library/Preferences/com.DynamicBar.plist",
  ]

  caveats <<~EOS
    DynamicBar isn't notarized by Apple. If macOS won't open it, go to
    System Settings › Privacy & Security and click "Open Anyway".
  EOS
end
