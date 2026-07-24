class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1454+5faa79730"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1454+5faa79730.tar.xz"
      sha256 "f38864d780367664426d8ba3b87dab2005d9ca1add5558a321d62118ba87b96b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1454+5faa79730.tar.xz"
      sha256 "7b2899e55265abf3831fdee9a464cbf915e4c050a8e9181a683a3934a8af151d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1454+5faa79730.tar.xz"
      sha256 "5bbb18da4ffa666a2c42d2fac209d46b658a7e50f4765f26abd3a1d1e2ca1e57"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1454+5faa79730.tar.xz"
      sha256 "555b89287be3f187f38a6a9727801986c51402def38a89f44a6cf404dbe7837c"
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
