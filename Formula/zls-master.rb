class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.11+b9eb9c41"
  license "MIT"
  revision 2
  # zls_commit: b9eb9c415d
  # zig_version: 0.17.0-dev.131+73c51c142

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "2fd801e42aa187aecc5f57a3ff6168bb8beb7c450a800360821ee91656a34e2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "33262f322e2d453ea6157b8e6fd8fd02fbda4be48bfee75204c0e1895a4957ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "63f4fbb6ad446ebe1e1729c35ec7f7cb656a5409740625507cfb6c3237fa279b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "f2c64e18ccfeb97e7958f9e9579a2020f33eedfedd7ca94084c35a9e51b129e5"
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
