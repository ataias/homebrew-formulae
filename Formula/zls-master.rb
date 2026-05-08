class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.26+f2986764"
  license "MIT"
  # zls_commit: f298676494
  # zig_version: 0.17.0-dev.263+0add2dfc4

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "3485c25fcf4f9c6e2edc5ce5017e637408b1c1c6ff54fb822046ab3dee2b3f79"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "974a3d1b1e76773e6475c4588ee75eedf485f0e17bd8948ab1fce96eae341f72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "3d6a1725b22134f83965411496a494ac25d8b0e4be31cf3fe2d2668e5a2bcd5d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "573c743bfec89a0a7efd1126ea3de32d87bc7bafbf697684d20d8db21ccf779d"
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
