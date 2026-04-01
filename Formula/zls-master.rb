class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.296+ef64fa01"
  license "MIT"
  revision 1
  # zls_commit: ef64fa01d9
  # zig_version: 0.16.0-dev.3059+42e33db9d

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "1eb615421e8d6894f6be5a8f9c8685138f33a5827262ed34b42eec93d8da2f67"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "e86eae63d297dc4d4e68719272affc125c9b9eeba42c83d81a0c78ab6c965f92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "4e73e41fcaccc11924474556f2ab3a83016163a6da3804c13f923747e6a9a8bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "97b7f93f6b60eb2f783dee69c580a90a88b5684ba8e3e96c79fbfa8c3ccf2108"
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
