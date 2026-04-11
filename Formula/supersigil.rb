class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "05a1def599dfce282fe001e55d8b3f9ebc43a6a4148e7bb5b08eb05db4d5515b"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-lsp-0.2.0-aarch64-apple-darwin.tar.gz"
        sha256 "38cc912286e8f3fc582fc0f245df35425e8b31533d1759837fa006f25cc74fa3"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "050b79175de7832cb245388ca334db1595766a064db05f7fa6198dc406ddc7ac"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-lsp-0.2.0-x86_64-apple-darwin.tar.gz"
        sha256 "81e77948fc4d9227e1ae691b0a1824a754d4359f92c802e94826160e589d4f76"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0bb0e7e703dd0aeb3918240e30101a5b52709b87487b48671f25c3de99af92a3"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-lsp-0.2.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "04b7d0b035e82bf889d4e82e3597fa45bf08987bc5fa8d0ce61c435a73fc9cc6"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a7eeb038417c327e2b3d7d003e3bb811f7e3405071707f3a10677068445484c6"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.2.0/supersigil-lsp-0.2.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "fa23b42bfa8ed09835e7646842ca46db7804a15709977969525de6bf79ce9eba"
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
