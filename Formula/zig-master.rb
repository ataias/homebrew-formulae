class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.657+2faf8debf"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.657+2faf8debf.tar.xz"
      sha256 "70a4eaa012db117e2388635bb2b7f8c17c2e6cd0fca4ad9fbb1b6ae1d16d9067"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.657+2faf8debf.tar.xz"
      sha256 "6265f0e9b675f86a4777b009c1f79f9774ae09626ace82238f27fe6e1baa460f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.657+2faf8debf.tar.xz"
      sha256 "73f449ce9d81ef85fe311b293855b603ed8b72c06f1fda9c442eadffadb6c6ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.657+2faf8debf.tar.xz"
      sha256 "f420613201cdcd7678356099f0cd76ce511931db61eeb1f2a6d9a156316aea2a"
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
