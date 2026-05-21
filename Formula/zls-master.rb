class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.40+d5d31d9a"
  license "MIT"
  revision 2
  # zls_commit: d5d31d9af3
  # zig_version: 0.17.0-dev.314+eae06cf5c

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "7b30fef151318dae8f2e66d34669ead9f25660ea4dcd43d52477197ea02b4d28"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "88294c38a59834de2e26833c1d1305416bced6b9d6b8599a4f605e1c8b5764d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "a0cf8f210ddcf2b1e595e2fa6f6e051f790478f3b4f614e05ede90eb6c2d5b39"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "fb0500d81ba20923c7ee015c77c0d5bab90dce708dcee355e6b802c8fac48954"
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
