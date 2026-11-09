class Wtr < Formula
  desc "Create, switch between and remove git worktrees"
  homepage "https://github.com/arzezak/wtr"
  url "https://github.com/arzezak/wtr/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "21801611140b722e653092a177dbf53c756c17bb728525f75dc8ab96a0c0cfde"
  license "MIT"

  depends_on "ruby" => :build

  resource "spinel" do
    url "https://github.com/matz/spinel/releases/download/2026.10.25/spinel-2026.10.25.tar.xz"
    sha256 "e13c7360e4f845b4a6b9f34a80fb6b827f950a480d1aa339e6cb25e5cb61a3b0"
  end

  def install
    resource("spinel").stage buildpath/"spinel"
    system "make", "-C", "spinel"

    system "spinel/bin/spinel", "--require-gate", "exe/wtr", "-o", "wtr"
    bin.install "wtr"
  end

  def caveats
    <<~EOS
      Add to your .zshrc:
        eval "$(command wtr init zsh)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wtr --version")

    system "git", "init", "-q", "repo"

    cd "repo" do
      assert_match "PATH", shell_output("#{bin}/wtr ls")
    end
  end
end
