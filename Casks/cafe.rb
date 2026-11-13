cask "cafe" do
  version "1.0"
  sha256 "b8938a62edc2d13ea5328b77355804c6c17769d6f2817c11891036224860d76d"

  url "https://github.com/arzezak/cafe/releases/download/v#{version}/Cafe.zip"
  name "Cafe"
  desc "Menu bar toggle that keeps a Mac awake"
  homepage "https://github.com/arzezak/cafe"

  depends_on macos: ">= :ventura"

  app "Cafe.app"
end
