class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "419faa069d3bd331f241696f411d6595c88d34ebbb0e90ec049f7a9122ab2e0b"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-lsp-0.1.1-aarch64-apple-darwin.tar.gz"
        sha256 "50ce678e346c9643bd4a14e5949257a68c6c9e8b8ca7fed73b0d2a9cfbcea39e"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "bb5328626d899dc28fcd9cf452896531db2b3ae874afde0b16793fa54576db73"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-lsp-0.1.1-x86_64-apple-darwin.tar.gz"
        sha256 "f70cdeca33ba583fe5d66bd5278037307e5b4b3225ea6abe3e6751b34a2e0211"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "07cae9fc18008757bd989111daf045f83af2e2efd685c558d1258f8d11ee650c"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-lsp-0.1.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "d925760f88deee0a7448c4df2d233e1aceb2f9772ee1f91567b79e88451d0f04"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf717963adb250a75d740b98ae392932c4b81beb25c236cbc28c1e3f8e67e394"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.1.1/supersigil-lsp-0.1.1-x86_64-unknown-linux-musl.tar.gz"
        sha256 "34b8234f986bb9c5abe0f5b3b5be8d601652e66a64cb3bad08d44109db8daaf0"
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
