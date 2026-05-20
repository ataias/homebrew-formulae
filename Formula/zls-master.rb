class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.40+d5d31d9a"
  license "MIT"
  revision 1
  # zls_commit: d5d31d9af3
  # zig_version: 0.17.0-dev.313+27be3b069

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "6cb9ccbfe61aa1534de455a3cf9170ee471ca4de190328808350dca7d5c1a339"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "c67b82151b4de2317dccac1ac0fa2953272ac9d38f8af3cf329d2f1c1839f4f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "8d523c3eb7751c787ef3eb43f54c75ff9b77ec3025e37067af3556852280ebb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "b6f3cd87eadb1f432b8a93221bfcef5df8af7e57928793450a750d118ef4c4cf"
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
