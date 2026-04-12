class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3144+ac6fb0b59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3144+ac6fb0b59.tar.xz"
      sha256 "a68477abba5bd20ebb61c7e3923fac4b56862f86d36388e2eed5b81c7c36c3d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3144+ac6fb0b59.tar.xz"
      sha256 "a8d0edc61a8e2dadf4e0a3b6bec05c68e1bd95cc64a6067a7355226a338eca15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3144+ac6fb0b59.tar.xz"
      sha256 "0fff41975a170859370e4cd5d8682c8a4d84b880208fdd806025ee779160b54b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3144+ac6fb0b59.tar.xz"
      sha256 "ba33fa7fd8b83a907ea22c0f79c1e2fbe8ca2e6c2472c706b84748abe559cf67"
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
