class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "1fdd3b13ced6436976263fb5eca06275928ff090bc6b86f1a7c336ac61fef86f"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-lsp-0.4.0-aarch64-apple-darwin.tar.gz"
        sha256 "fc750d53cdb377b503b3013df7658f39862641d2f28c2866e2f04051342df3cf"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "2eda3473c88d05365f58768bb2d58ad7c0e73e380ced11da72b51c0b6e9c44e2"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-lsp-0.4.0-x86_64-apple-darwin.tar.gz"
        sha256 "e44e57ad455d4edec50172cf227d8db8cf5e3ac6605644db8e68924986d75996"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "32a995c5ac6c129f3b8f83a00406441d2359f7c39f53ad2b6b1fc56cc1853614"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-lsp-0.4.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "fdf5cf640710e1b9e2c5e48c182d842cf1c47b2ab0d7d1057977644bb9b8aad2"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e952ad1a87c5aefd65b0614860c1f9728dfd7346073ec75c7bc2bd5d810f3ea7"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.4.0/supersigil-lsp-0.4.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "af8c2f18d87d4e8e40c7a00c48deed149a2123b274e4369a6e6e29273feccc24"
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
