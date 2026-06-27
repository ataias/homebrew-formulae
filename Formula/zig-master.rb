class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.978+a078d55a2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.978+a078d55a2.tar.xz"
      sha256 "8dfb7c5f4dbc5db2f98c1725123b269c52bd1f0bae7183b351c025d33788f94a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.978+a078d55a2.tar.xz"
      sha256 "90bc3bb472a5f3155450c0341a7366e23a068c642a096ef2ff9a07a759261d88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.978+a078d55a2.tar.xz"
      sha256 "edfb24b1a6ad423d9b84a0a8dfa155ce1484ecfaecf9aa51de4e5c13ba5272d3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.978+a078d55a2.tar.xz"
      sha256 "a4761c05b039f6954e15b7d8aa5f65df7c58ff4ebf2eb3eccd7786430b11145c"
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
