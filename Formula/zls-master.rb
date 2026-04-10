class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.300+f391142c"
  license "MIT"
  # zls_commit: f391142ce2
  # zig_version: 0.16.0-dev.3133+5ec8e45f3

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "31d9891185d1366cf1338bdb775c5ec10f94e9458e2e80d5c13fb487b276c060"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "6e26e58219ea25d069b5a394730b9c6098b005ba5cf324e4b15160fc73ddf0e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "b99fa86d6eccd2bcf820b7b7d028b5f5112bd7ace245b9fcaad06a55eee0c894"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "f1b9b04a667db8b38cfe341fbe12bf3bb3aca5a67d63c3c866cb659a1ed0eb3a"
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
