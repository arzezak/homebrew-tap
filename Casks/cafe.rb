cask "cafe" do
  version "1.2"
  sha256 "a39bb8a0926702566d310e96054e524daee8b24bfd50304479b1fe5653a60792"

  url "https://github.com/arzezak/cafe/releases/download/v#{version}/Cafe.zip"
  name "Cafe"
  desc "Menu bar toggle that keeps a Mac awake"
  homepage "https://github.com/arzezak/cafe"

  depends_on macos: :ventura

  app "Cafe.app"
end
