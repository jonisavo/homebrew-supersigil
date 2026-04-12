class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "9e1934f2ad0461adfa56b4e32c5a6a751ea85a0ccdda1cd4b0c055d251883458"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-lsp-0.7.0-aarch64-apple-darwin.tar.gz"
        sha256 "b05a4d941a12ead24c7da438f108ab6285797ba81ee5831dd641c37003952dcf"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "349c3f6f649c2f748f6d0905a299b49b1e791a4ac2740dc60c0c1c91ba423747"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-lsp-0.7.0-x86_64-apple-darwin.tar.gz"
        sha256 "810b199b1ea43883dd5684132a8dd824d24395834eee093997a1a1a2e6135b53"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a5887da35d68d716d3eb1574ef9da2c441d3498387fbacc9dfd2e3c097aa743b"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-lsp-0.7.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "a10f43afd41133f74b66cb6e883277baff6278b96b3eaec4aaa3fb2dd9ad4a08"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6bb2deb7c0f46d6bbeb1da9f24b37d06d7e4118635e24cea526c501b4a852644"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.7.0/supersigil-lsp-0.7.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "e99b85da83b3c60b8622f792e3941288aee01f44e1cac0d992c8ed1aeebe3e2a"
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
