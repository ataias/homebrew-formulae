class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.420+8086ae176"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.420+8086ae176.tar.xz"
      sha256 "7e230c59fc07b70ba50ee432481afd65f75b6386d4f74c71704d4eeca55c21c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.420+8086ae176.tar.xz"
      sha256 "3a43e877f1a2a6e4ed7e9135da1be83334d938701b1a37ed55c8ee84a5bd29f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.420+8086ae176.tar.xz"
      sha256 "d2317ee294f10dbce02dd5c7f6507de4e48ab732828a72ec78b3ba8f75e42569"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.420+8086ae176.tar.xz"
      sha256 "a4e3053460b27e879b728e0a21e2951c53036f71e15bb456097f299653909712"
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
