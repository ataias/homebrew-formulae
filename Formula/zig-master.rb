class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3039+b490412cd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3039+b490412cd.tar.xz"
      sha256 "cc50337824c49d44a869ab88430385d79d1e40607ec292f7ba00f05425aa7f06"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3039+b490412cd.tar.xz"
      sha256 "8d9b7a6aacbbc08bc05e913fdae7f37b7dfe09fa600861372b5364b8a2c148f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3039+b490412cd.tar.xz"
      sha256 "30de94efdf055984624b641ce4cfc4efcbfc16c60293bb4bb99aa34fd125ee82"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3039+b490412cd.tar.xz"
      sha256 "0d15df9bc74ca7309707d5e195e672a4ec24d2429e2ecf007c1c0e2c7fd84902"
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
