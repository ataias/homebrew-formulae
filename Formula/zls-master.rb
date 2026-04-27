class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.11+b9eb9c41"
  license "MIT"
  revision 3
  # zls_commit: b9eb9c415d
  # zig_version: 0.17.0-dev.135+9df02121d

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "ee2799beb6f89568bd0e790812483e730203b4b71fb01996cfcc29a40b1c0663"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "2dba05e46d251eda5be137ab5c640c69b4b1ee916ce567dfbb9a1ca1bc6f5809"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "4128e178dbc4d31feef324734fc4f017fa32ad8c94501b361bb9f23b04a73517"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "43b506367749ea2bd0b81d68003295b64d306c85e9a8b520908b701ce59a27b1"
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
