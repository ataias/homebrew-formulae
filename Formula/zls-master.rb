class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.44+8da87d4f"
  license "MIT"
  # zls_commit: 8da87d4f33
  # zig_version: 0.17.0-dev.387+31f157d80

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "e42b5ccfe3e391a556a9444a29c5c198704d2d69a1239de741edd8dc7d298d3b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "ff9d24d320a2f796d93a01b2828d36b86d21b4539106278efd5b0ed26132764b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "18ae81bf02066edaa3ce83325b6eb018dd8094632b75a7ac3bf21e1ab9cf5c15"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "b63109f4d974debf7abcf1706aeeb361cc253500c3871583c89f792b8d22a6b7"
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
