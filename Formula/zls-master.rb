class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.11+b9eb9c41"
  license "MIT"
  revision 1
  # zls_commit: b9eb9c415d
  # zig_version: 0.17.0-dev.101+4e2147d14

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "89eb65a31c754d518ab6e812ce3b25873f486f0623c8d49e00a12a856b019366"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "ea7e47bb73a890fe1d71492ad32a59cf1643fdaccd7cec46bb6316cca63aad42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "19d913747e45c4b1312bf94ab939e77958e6b011c00b6e8c281464cdb621d80f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "136f46d62f25c743086244ee49ff310afa2053cfce5b0f00eebac5c2c0956f53"
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
