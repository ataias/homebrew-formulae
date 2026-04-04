class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3070+b22eb176b"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3070+b22eb176b.tar.xz"
      sha256 "86d50f56a4bb5a3359f6d8a58932cabe87245a50405b79b2cf6dad68f05a403d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3070+b22eb176b.tar.xz"
      sha256 "179e378a8b415735641eaba693910a2b7c43ce00a1d2c9c902da93cf44dc8b7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3070+b22eb176b.tar.xz"
      sha256 "adbf9a7998539c5630b6890d589a93294169d73beb504f9fa8d9569db976e81c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3070+b22eb176b.tar.xz"
      sha256 "f8a3a58b83011d4fcc895032418867ca5ba812ff76df60f563706269cc098353"
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
