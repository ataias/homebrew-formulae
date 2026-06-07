class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.704+b8cb78023"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.704+b8cb78023.tar.xz"
      sha256 "c0756d4c0b116425f7aa254d3fe1b5927813b24fe4b44305c5bdec235ac98ce4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.704+b8cb78023.tar.xz"
      sha256 "f2e1a435003c9f3b06152c1f41e1cfc0d03893d2ff0387a042303278c01f0b5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.704+b8cb78023.tar.xz"
      sha256 "14c6ecf89fbbd210ac2d0f36a274cb9b2bd21c67cf8c8f74cff1242ef807ca1c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.704+b8cb78023.tar.xz"
      sha256 "17eaceaa1b7187ed34dba86a947151d0ad0c5e5da010293473d519da2535b682"
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
