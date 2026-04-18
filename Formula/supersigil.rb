class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "42f9f43ce734378fa0784bddd98141f43d6d09c1d75335b164b9e9290ae6458f"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-lsp-0.12.0-aarch64-apple-darwin.tar.gz"
        sha256 "2835ed403f3628750c6cefa9115fb05cda9f6ff395f8d225e7d735734b1d5921"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "fc66ced832ff84f0ec44e507cea26834040c7d0b4ca6316b51e9f4c0442fabba"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-lsp-0.12.0-x86_64-apple-darwin.tar.gz"
        sha256 "92dc27189dc534c90fb5e9285b951954317939af53f19ac5abc3333c619dda18"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c154c9ea9d24cd3304025377bafe2b2394735174d73d39305cea74edb230f897"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-lsp-0.12.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "92bcb674ea3767dc6a9f88eddbf1739509db018cb52689f4ede9d4648ac4597f"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "34dbbaa20b859adb52b3eed227ce97c14a4984a1c5b951868e5a17b7409657e2"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.12.0/supersigil-lsp-0.12.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "f6c9cfa4587ba68ef0d8d9fb26a204d2486247832da54d181b2214bc2d63d98a"
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
