class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3128+ad7a02822"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3128+ad7a02822.tar.xz"
      sha256 "ee7d3d45abaf1f9dd3584ae171ad97f3d8d803201eca940a8b3a9e008a06adcd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3128+ad7a02822.tar.xz"
      sha256 "d4c8240285fdd78d99d46e80b3f3aa9e39d07cc870ee08007299b86b05b6b029"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3128+ad7a02822.tar.xz"
      sha256 "65affe9d7cf7d79690a09dd55d2a6eaf9fd63c7b68288179c61010f8ac7c3154"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3128+ad7a02822.tar.xz"
      sha256 "17f23d710fe48fba6d58f62f4091627eaed7ca93f74e05ef22788d7f796b869c"
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
