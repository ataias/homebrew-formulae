class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.263+0add2dfc4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.263+0add2dfc4.tar.xz"
      sha256 "e518d3046e6b13d596ead24d2a7e58b260f66ff1ea4e2b0985aa277f28c24bde"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.263+0add2dfc4.tar.xz"
      sha256 "5f5fde220ffe693fb4f32456327deb1d6b1147cab01104190764264a8288a1d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.263+0add2dfc4.tar.xz"
      sha256 "3f83abe2b63da77c1fa4b98b2fc701e7aa669bf907ae117b64b78b2e9e97de1a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.263+0add2dfc4.tar.xz"
      sha256 "0830fb0c6e27766660efe97c26dcae1117319a27a55b50cdd88bfc5e2e6dda3b"
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
