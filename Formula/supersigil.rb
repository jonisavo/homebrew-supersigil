class Supersigil < Formula
  desc "CLI tool and verification framework for spec-driven development"
  homepage "https://github.com/jonisavo/supersigil"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "f124db2a8051c066f2406307d021c563fb0aaa71f8850558ecb321b18846ded5"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-lsp-0.9.0-aarch64-apple-darwin.tar.gz"
        sha256 "ca484ff9365e764defaa1a1f33fe17e2895d06fe2b26f3262619e4e44d79f110"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "3fd258c5766129a61c1cf110919471a0b568ae8153b847ebb2a3e3e9ca5e1d44"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-lsp-0.9.0-x86_64-apple-darwin.tar.gz"
        sha256 "1e02d974a070e47e78dbf1b70985760e7cb3dfb2658038f0a1bd1730dd84d17c"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "79d27f10f51ff5ba663b49df3aa2057a1bcdf37e0055833edcc250dc8e01296e"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-lsp-0.9.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "b9f40a5295c791bb0821b895e9c13b63b5e85f5d800c5e80dba85667bea9af8b"
      end
    else
      url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ba6495796a86bc0eaefb9b2d12e73257f35b10bd08e9fd45310d41cc5fee4b61"

      resource "supersigil-lsp" do
        url "https://github.com/jonisavo/supersigil/releases/download/v0.9.0/supersigil-lsp-0.9.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "eb754f87342495c91234a9d2532f56e213557507992f5e16dc7f853dda81c68c"
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
