class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "c9dcd65003b8bbb7b1308735943d07aecc6e6fb9fdea076c4bdbf9efa7161a62"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-lsp-0.6.0-aarch64-apple-darwin.tar.gz"
        sha256 "92b142b5e7e6fee53bff0d422a938ff2b95ee2a2863ae5641c12224d3327146f"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "1e92ad2ee1fbada48972ad37bb0bb880d0c886804d273835f49a4dea9c4088fe"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-lsp-0.6.0-x86_64-apple-darwin.tar.gz"
        sha256 "f568947d9fb98fd4b7e7ba69c28c4830d89ac855e2f9ef5e615e802bdcb1191a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "de922f6533914afb9fca046a1b2bed63f74fb26856f4c032377e39631f0b4433"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-lsp-0.6.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "c5a1113516bf52fbaf17f8f225c60046dee8d4273f2e5daf56b8716bd416b212"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ec19bee5cdb01efab364d2f3b2fe19e3a9094cadcea8baed84a335e57a5904d"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.6.0/supersigil-lsp-0.6.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "95aa5062cdf651e33a3c31eb01e4c44b8fabcb64f31d52047ef6b3319747b95a"
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
