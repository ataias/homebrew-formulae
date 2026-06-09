class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.813+2153f8143"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.813+2153f8143.tar.xz"
      sha256 "36673d2513afa4a96c86780648ba504beedd7f0451389091cf9d53e38d5b4840"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.813+2153f8143.tar.xz"
      sha256 "3938c46ae4bca3c13f423b09503e3ef00bb4b7ef12b8bc1e5122ede366057a5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.813+2153f8143.tar.xz"
      sha256 "aa67b418d50bdde3043cfe765016d5387a2333b514ada2c57f24baae4005c331"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.813+2153f8143.tar.xz"
      sha256 "b0d46ffc4587b9e8dd0b524ee5bc4da1e67f28bba55e7c534cec64af2f2d7a74"
    end
  end

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install Dir["lib/*"]
  end

  test do
    system bin/"zig", "init"
    system bin/"zig", "build", "--summary", "all"
    system bin/"zig", "build", "run"
    system bin/"zig", "build", "test", "--summary", "all"
  end
end
