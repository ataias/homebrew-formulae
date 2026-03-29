class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.295+0bb4338e"
  license "MIT"
  revision 1
  # zls_commit: 0bb4338e15
  # zig_version: 0.16.0-dev.3028+a85495ca2

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "87a7a9b14af90fceb8a98f0fc4497dba35ed2682ae40feda878947e0ebe88f9b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "8a5292f7302879fdde3eb89abf364ce7742312dc4c3c96f00956c8ff2170eb71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "7edd728848b696272305ef67e445caa90b67e60cb092ed757b9ffb582fb15300"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "fe0b770fb03801e484771bd0826d9804990b21d5f6cde338e7937770b30a8154"
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
