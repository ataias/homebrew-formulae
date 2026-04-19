class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.1+295cedd8"
  license "MIT"
  revision 1
  # zls_commit: 295cedd8dd
  # zig_version: 0.17.0-dev.27+0dd99c37c

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "ffa63a20c0e2283b77270165a18d3ecb20ee5b05fa09d08b5b9df340cb1af650"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "0a03e11b8687a97b0ff382aa52017eec1307bfac3382d74f2bb6f79c8144a4d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "30fea21911236fa281bf0adb5721d3e118a77a76273af67034697e058e7f64a0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "55e443df1ed205c34531323af907949f57072d9d04fe2cf51d10035647a96819"
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
