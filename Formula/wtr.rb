class Wtr < Formula
  desc "Create, switch between and remove git worktrees"
  homepage "https://github.com/arzezak/wtr"
  url "https://github.com/arzezak/wtr/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3b8001f63d0a6fbf4da33ea1233811ada492db51972c37c013f3fe73dd6a1f5c"
  license "MIT"

  bottle do
    root_url "https://github.com/arzezak/homebrew-tap/releases/download/wtr-0.1.0_1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d52329f642c0459ecd0e521d3f2bffeeaac8e6ac63627ab5950a24ae7af0481"
  end

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
