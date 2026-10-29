cask "dynamicbar" do
  version "1.0"
  sha256 "4a65726cd40b679f54d7fc9b596dd75442c79ef970c8528a5bf0ee41952acdab"

  url "https://github.com/KAG1O/DynamicBar/releases/download/v#{version}/DynamicBar.dmg"
  name "DynamicBar"
  desc "Liquid Glass island for the Mac notch"
  homepage "https://kag1o.github.io/DynamicBar/"

  livecheck do
    url "https://kag1o.github.io/DynamicBar/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

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
