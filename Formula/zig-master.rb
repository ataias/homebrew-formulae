class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.87+9b177a7d2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.87+9b177a7d2.tar.xz"
      sha256 "7957d6f9dc5d5196bb83169601423284a6631b7084730e2214ba862224f47abf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.87+9b177a7d2.tar.xz"
      sha256 "c7efaeb0b9ec593121c7c3620d79f0771bc6b0e377c445d37caf27e9f7f5c965"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.87+9b177a7d2.tar.xz"
      sha256 "74f69da4621dd437368b3fac9ad8596cec6f40c811ad728f75a12fdd82ff5c51"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.87+9b177a7d2.tar.xz"
      sha256 "a3eae1cdb9643cf68e09e97574fb6780699e05148c270e52347faa293b80d858"
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
