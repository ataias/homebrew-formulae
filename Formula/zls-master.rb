class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.26+f2986764"
  license "MIT"
  revision 2
  # zls_commit: f298676494
  # zig_version: 0.17.0-dev.292+fc1c83a36

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "900f238adbf05b1b9f3de7b54282d4a5d47a752aa375d215cbec38fb107d850f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "25041e5e8126d5cb6b8e0c33ed9651ee07424839d71f391b537f7d32058eedff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "36fdfd24aff0e5908c0418d6b471f10deeb0504cf880be5580d3a97fdc548ef5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "43b642732e578c2a7dbd0102611a5a0fbde394a88beed589d203d2758eb31b84"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end
