cask "cafe" do
  version "1.3"
  sha256 "ed8ec272fdc917d7a055d473b03aaf926c5a87616e11392c1b3a0a7f6e62eb58"

  url "https://github.com/arzezak/cafe/releases/download/v#{version}/Cafe.zip"
  name "Cafe"
  desc "Menu bar toggle that keeps a Mac awake"
  homepage "https://github.com/arzezak/cafe"

  depends_on macos: :ventura

  app "Cafe.app"
end
