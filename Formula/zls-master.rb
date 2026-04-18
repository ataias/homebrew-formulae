class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.1+295cedd8"
  license "MIT"
  # zls_commit: 295cedd8dd
  # zig_version: 0.17.0-dev.9+046002d1a

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "d0bb72412e75459f0d7f549d717ba2e253161c29b79a65e8de64b83b866b54cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "c0b3cfc3ab2e9030599d3df41a822abad8be651398f3517f4f773efb2d899742"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "e8a0f31a2e474ad3079584ff69a517c3c75facb9237b21161cb7c9662169fb3d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "a5339a41ba47f3dda2d6679001faccbc7c9aa6d66df172dff8cd2875a2af069c"
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
