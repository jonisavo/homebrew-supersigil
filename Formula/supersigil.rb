class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "84cbeba6b22bdf6f5fda9defb1b1363d1e96f3b368735abf8d0691d80bbac505"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-lsp-0.10.0-aarch64-apple-darwin.tar.gz"
        sha256 "77fe9c4e37eb5a0e4afb46e3f0a0d3201066d4bdadc6a29d3762c157cf7c721e"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b4abe4e71ab9f30a9d3f13be444dfc913e60314b212ff5e1533cd1d041a84d3"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-lsp-0.10.0-x86_64-apple-darwin.tar.gz"
        sha256 "a0226bb8022f3dfb292e89117b2a43b004005ba14d3959e7bfc2beb7c934630d"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "14c6154f48ee688a28a85626df552a58b23fbbcd0ce1ca195badc5d04b204d58"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-lsp-0.10.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "55be40a35308283def63d96fc33b0845758cbcd952a9f6e7b9305c419ceaee99"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fa1bf592b026105ea9e7440453a5d889b5df52d7850409980a0fed3f623f2a26"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.10.0/supersigil-lsp-0.10.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "c5e677085f2f42aeeef03259d176e16ec67f7a76a6a9684d801246741a33a345"
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
