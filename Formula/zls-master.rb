class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.41+31963d0a"
  license "MIT"
  revision 1
  # zls_commit: 31963d0a0c
  # zig_version: 0.17.0-dev.356+3140b375f

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "98adb3e070855a03719b616689c60fa2cf5dde23d4f72a2ba45b06637fa3a269"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "c26808628cf585e61e74f54e2c2451b8cd2d6fc08cea2fb897caf0440a1e4c9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "7927dd393ad518ab2dc6febb299495310d1e586bb94c3cfa87b5d0e3ccc57cb2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "b3ca8c0944b85c8d0b9e637bfecf60f226dea2dc98fffeb1d5ef2eff0f9c710c"
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
