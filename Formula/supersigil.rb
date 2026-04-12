class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "7886f5a22910549670da0a064d0c76686b669ee4e908e377ac6723da7198358f"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-lsp-0.8.0-aarch64-apple-darwin.tar.gz"
        sha256 "a9fa940671a309830cec4736bfc7241123f445ca55c92bf0b16b9c06a27d4117"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a49ac4870e64f6a26e2592126f0db807ea213cfa36fd7c0cf7c23efa3299453"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-lsp-0.8.0-x86_64-apple-darwin.tar.gz"
        sha256 "5d29430905421aafef9343e635c2d075079e8f6c3a96aa942735a412af04a133"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "11221ab94fc85505b6cc755be7e89ed542a93dc5f52d22cd8b1a719dd79fc5b5"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-lsp-0.8.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "378ed35712043d37ccf0a40920f57da9a6c72926978f2956c53562aeb1ae3a16"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b440c464bf220e0da988e13c06db730308ff13874791bef6d9cd0b8093431138"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.8.0/supersigil-lsp-0.8.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "c7d36c2db63f3afbb5b57e68322a340ff736488696ed5b23434379f762db1732"
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
