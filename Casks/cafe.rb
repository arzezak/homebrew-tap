cask "cafe" do
  version "1.1"
  sha256 "46479e97ecc12169850d09c3c3d2d879db70e493903684fd4e80d334ebbf4bb1"

  url "https://github.com/arzezak/cafe/releases/download/v#{version}/Cafe.zip"
  name "Cafe"
  desc "Menu bar toggle that keeps a Mac awake"
  homepage "https://github.com/arzezak/cafe"

  depends_on macos: :ventura

  app "Cafe.app"
end
