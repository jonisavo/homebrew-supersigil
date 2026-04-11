class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "3212fa114096b7bcd0072665fb8e1289cc0261e4ca8551d6f3cbfefcba4468b0"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-lsp-0.5.0-aarch64-apple-darwin.tar.gz"
        sha256 "a2a51bb7c1e762ccd83ea3110ba8f925a2c20eaa310277e0d46a0fe2529c76e5"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "8eff6b3e4f08d83e15c2d494b5062672b17b9cc7a2c22b3874154b51055d0781"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-lsp-0.5.0-x86_64-apple-darwin.tar.gz"
        sha256 "01582118a62c67df5a46c7457629e4a1c37d3be69337af41eaddd7d85ce91ec9"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4820fd907f08c26ff81b6c5a8495229ffafe732355ad6582f23ec0b525550721"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-lsp-0.5.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "107c2146b8e08b00d7dfed9431f4d346f7d92dc5346299b331dc654f213acb46"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2e3e83cdf8b92dd11166f1f5b91af5309e29f05610724bc5ec950fc5271863ef"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.5.0/supersigil-lsp-0.5.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "7dc113429c9dcaefd5c87aefe457adabb029cb78459a495ea21f724c30490e85"
      end
    end
  end

  def install
    bin.install "supersigil"
    resource("supersigil-lsp").stage do
      bin.install "supersigil-lsp"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/supersigil --version")
  end
end
