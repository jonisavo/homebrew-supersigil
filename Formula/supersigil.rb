class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "262310b75b1213060badf986d582990c603ad8c62d7e25622ecd7f307fee74df"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-lsp-0.11.0-aarch64-apple-darwin.tar.gz"
        sha256 "42f9b66f39dcab06f2990727701f2d1e208dd595cbc8fb834150c84d0f82f5cd"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "f77b065e8814c4adeb5bcb2212038283a35b9d134f4fa2bea76298d7cbfc5ef8"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-lsp-0.11.0-x86_64-apple-darwin.tar.gz"
        sha256 "3a9dd8926404d8268214529b7a08d15c693195e9e7e0aea0248ec02226cb40ac"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa3a7a9a42eaa8396ecf5248396633a2d6f654b55cd70094926f2a2d41a330bc"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-lsp-0.11.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "2d7d74fdecdff04e32521fd9f90318e089d284366f2236fdca8f7ab680c45a6b"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7bdecc27e2db9187c9625af820264e924f3c6e6d55e85c6f7113b47ba95e9264"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.11.0/supersigil-lsp-0.11.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "a113c61a3a7589adb123088428f872b26e076586f02cd16685c1207328315a0f"
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
