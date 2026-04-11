class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "6971878c8db040fd0106bf53cbc6337180507ac7843e88b3858e9ed208e9c9f6"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-lsp-0.3.0-aarch64-apple-darwin.tar.gz"
        sha256 "6fe1e655286a6a7c1539ef46a38e7c422f2e5029d2d5d75bc4dd19d810a9a726"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "eb8239502ae50520876475230eba2af8c6560a14794390a3cfcd2b88d8404bee"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-lsp-0.3.0-x86_64-apple-darwin.tar.gz"
        sha256 "ed27c3dce29d5b037cb19cf540c06df36917fe60ed1bc19d62f0e0c65801c649"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c74ba731e8a3328b09718437c25da22fde6106c3299c487d89a48899e2978bc"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-lsp-0.3.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "944e61b4dbfb13b1bc204d9b7e1925b0ebf3f30f6d2401377ab1e6e2d4307c4a"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1c91bb79c7440f9c420fa09380b2fa1ee34fe9f6e74fe1b5e0a19b9c30f6075b"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.3.0/supersigil-lsp-0.3.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "65dd7e6925c92c249270bf5a5c81a313ce7ee6cae4561b1843c277106dae44e1"
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
