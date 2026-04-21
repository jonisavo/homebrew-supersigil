class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "fde7c19364aa3a448e784f378bedc306735f6f6761cac37fe3877ff38255a252"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-lsp-0.13.0-aarch64-apple-darwin.tar.gz"
        sha256 "402b66bc3ab8a726ebfaa4a573520daabbe04772bedfb8b83d86eb61a5cf1a31"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "4017cf8ce4cdfc250aa4f3ffcf7717319331f048cccc32a39126fa17ab22c3f2"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-lsp-0.13.0-x86_64-apple-darwin.tar.gz"
        sha256 "d001f7c3f2d470caec064c1aec127557398e644fdbb1930ffa4154a94e0bfe40"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5dd98a86087db9b83944ba8a51d028921bf329851d91379318cabaf7d7ff2a75"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-lsp-0.13.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "d878f0ef2eba0fcf2110205e82f0cee0abe3d2045a1cc88a4f5b73a257bada71"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4982f79339fe0e99532a099b0cbe7f2cf2d9d658e8f4243872d7008ce813ea8e"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.13.0/supersigil-lsp-0.13.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "91e3dc2797c5a724cbfcdca17f84e39013b39ed30fd08ea8ca3adffba59e5187"
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
