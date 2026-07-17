class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1415+64dfaa568"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1415+64dfaa568.tar.xz"
      sha256 "c511786f75edf53e41aa274a7a0f801112f80636ec94d4db122fb153d0fae8c2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1415+64dfaa568.tar.xz"
      sha256 "42c4f209d40c0da3c361a0daa2abcfd4220ccb545bfc75ab0ad10aea481f2370"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1415+64dfaa568.tar.xz"
      sha256 "0edff601129c722f3151c61079ca9a878058c10e8e2ca92b13cd667ff558e3e7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1415+64dfaa568.tar.xz"
      sha256 "db27c15cbb979760a5e31cc10c451f27b2c79c02560776ae3f831161584b099d"
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
