class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "bc986734aa88acffb48aa6f5cb9344429a4fe1239824dab698e7481d75a3afbb"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-lsp-0.14.0-aarch64-apple-darwin.tar.gz"
        sha256 "df26c184c5dada81d69c20d8878a36d4ef1ace7faeb4ad5a22e212b4358821fa"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "7f1b530ef007e0bfec7fd16b3f44fc5e702fe8abd90b1527a96cef67e2595969"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-lsp-0.14.0-x86_64-apple-darwin.tar.gz"
        sha256 "26558a094fb36deb0475def9c5cd69d58a39157edc7663e0bb19c55365b8918a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "18918b8543b881074f6990bd8a12166f332fa4c8111f55ad7acb80007d012c4d"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-lsp-0.14.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "21a1b2807812e77ac035aff404fcac2053c1b2edc5991fca79d6be8e04dc518b"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "667ddbfe6d3a469e1ad6b95a58a78d98f335029603c1eb3243d3298d750c0324"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.14.0/supersigil-lsp-0.14.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "5515065fbb0d7586db894b2ca6ab7a95a7fc6509f4adefb2a1cb21bb6da03a95"
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
