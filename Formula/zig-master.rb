class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1252+e4b325c19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1252+e4b325c19.tar.xz"
      sha256 "c30f90446ed23d459fd377480ec8c606193bb55c95312549d36844e79854de27"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1252+e4b325c19.tar.xz"
      sha256 "169836180f1f1bbec3a7424a5b6e6373934ede14bfbbafe1ccc5208ff2d1d2f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1252+e4b325c19.tar.xz"
      sha256 "ec424f513db49ac34137a139145bb92d322a065d366fa259e7a931c161a27a67"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1252+e4b325c19.tar.xz"
      sha256 "d9e60749c52e17464d41b7a1dc5da46c4bffb7b3171b1fac6782bc2ec3e28977"
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
