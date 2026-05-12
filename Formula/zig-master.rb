class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.292+fc1c83a36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.292+fc1c83a36.tar.xz"
      sha256 "eba6ffe90d6932b49b81db452dc759cfdbbed59dd898b95331cbee7dcf261601"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.292+fc1c83a36.tar.xz"
      sha256 "f716e1eab0853cf84a9001fa35f6339d3792b4db5e4a6e0ac79d10b3a7e68da0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.292+fc1c83a36.tar.xz"
      sha256 "432b2c19310039c3f15f1e4d445a12a14a465604a3a55e17c91ffcb8a58f4af0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.292+fc1c83a36.tar.xz"
      sha256 "9def546ef6f470e47dd5da58490d1ecb075e42731cd8f8e0381bd95edfdb0918"
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
