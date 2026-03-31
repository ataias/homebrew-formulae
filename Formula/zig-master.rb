class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3041+3dc5f1398"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3041+3dc5f1398.tar.xz"
      sha256 "d2191b807592b6e2c990cb36fbbf24f18f7f924ce8f4bd3cfbf9e6b1a6c0a025"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3041+3dc5f1398.tar.xz"
      sha256 "96b69a14add4ca57163a03a139fbfbd64650153e40827ddb64194c33d5cfddc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3041+3dc5f1398.tar.xz"
      sha256 "6fd34a298668fffd18414cb151a276c29ec5d92a5d5de3ed7e424f1b9302251f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3041+3dc5f1398.tar.xz"
      sha256 "52c1cb7444d163cb4f0d4453024d8cc913bc030a6126ce9dfd467052b02eb766"
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
