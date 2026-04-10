class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.0/supersigil-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f7a5ead6177c2098a0d4c875ff13f14f8a89552c9a6e4891d69799d10ad96e2e"
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.0/supersigil-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3936b2f2b679b9427c6d1f2730dc8d1d6f87ab7667e5a411b9aa6ab3524f8644"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.0/supersigil-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87f12a9b5b16ac5d30add8e67e42627a20618a7946771d486d3faad6c6a363d5"
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.0/supersigil-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "85e4c1e16684c3f2eb5cbfd3277e1d82b03dff14eb5a60d271e3e09b7059100c"
    end
  end

  def install
    bin.install "supersigil"
    bin.install "supersigil-lsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/supersigil --version")
  end
end
