class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3153+d6f43caad"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3153+d6f43caad.tar.xz"
      sha256 "9121e3f03515a3434ef9f362f8c541540968316d33ed6485b2d8a31dc7332fe6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3153+d6f43caad.tar.xz"
      sha256 "0251a8414f98513a33a7a7bd1f6cc13fb59f391168a742eee47b8c685e9827a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3153+d6f43caad.tar.xz"
      sha256 "e46037f7747492b405a42d40bb9bf3ca3f28c71cf9c1ccdf165a4de74cb484bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3153+d6f43caad.tar.xz"
      sha256 "afb3016a94a8b5608d364e58ec7b01111af775a020d5f93f69eaebde2053fe77"
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
