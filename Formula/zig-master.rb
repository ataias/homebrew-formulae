class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.389+f5a1968f6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.389+f5a1968f6.tar.xz"
      sha256 "fbcd8ea6c710869b16c413ebac840c5e2f95a97eeecc956ecf0a552ba346f4fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.389+f5a1968f6.tar.xz"
      sha256 "4c7e66f86e7da1faa7b8d1121b73d08fabb9c7859cc5a9201843a8a61b8deb0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.389+f5a1968f6.tar.xz"
      sha256 "9a060a84a32b9165ffc17cb051f7b3f3ad1b749b1faaa7f40689f0bc99ef772b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.389+f5a1968f6.tar.xz"
      sha256 "f5cbe4a5ee819a511176f6ea352c9ea355d7babb4dc74cb17172386473025683"
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
