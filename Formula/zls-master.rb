class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.21+5767f2f1"
  license "MIT"
  # zls_commit: 5767f2f1f1
  # zig_version: 0.17.0-dev.248+95507faf1

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "ad29508a98c3e778c5fd70aa6003c043768681c1e8168dab0691babadf01aa90"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "6b3e2cc25a498578fb2be63493414ad6c2f1772b91d3745980a73f06cbf21f01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "09e2d90058ec62050dbeadb01afc370585f2088463befa34404d7f95a422c7e7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "e24d887bc68403e36d33efeff15525781eccf155f87756004e8e62d7571e1191"
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
