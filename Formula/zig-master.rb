class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3133+5ec8e45f3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3133+5ec8e45f3.tar.xz"
      sha256 "a997508001d8fb69546c002130df62c74d1e7630a49ad67ab0f9e1a0e8d877b6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3133+5ec8e45f3.tar.xz"
      sha256 "e79344772a7db3132cff50d3fcc37636a0ebab0bef571df313cede9faeaf00ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3133+5ec8e45f3.tar.xz"
      sha256 "0a165b9bc6629035f8d002f8829c30c64b2cfffb92239aa431c6993a47b6e709"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3133+5ec8e45f3.tar.xz"
      sha256 "4328c8d07bedb22c331721a570992fe4a8b0af795eeed670bdc27a49bde032ff"
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
