class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.40+d5d31d9a"
  license "MIT"
  revision 3
  # zls_commit: d5d31d9af3
  # zig_version: 0.17.0-dev.315+5b647b792

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "7dddf1eadb79b6c283b87bb4ed14950cd86c19f852a47b217de5bb7288cb01e5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "a02d5dbfbca1252d7f78bbd9b5ea78357419bd3b76e404c9faac2d03b87573dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "4f2217303db9de2cd09eca5aaa9e2d28c1148cf78e1c054073f51a51ce7df90a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "b0c19e602623a41dcc953b18d5ea5d0571bd5587b92de5da92031c09315619e2"
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
