class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.313+27be3b069"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.313+27be3b069.tar.xz"
      sha256 "0e520d3c1c19259963e35fe96651a1a6b0b3481b293722e4d5ef824af6c69d06"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.313+27be3b069.tar.xz"
      sha256 "2f58dc35e846bdae3b8a1ecdc685abd753fd05fdcac7970110c23c4befabf74b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.313+27be3b069.tar.xz"
      sha256 "3c24f124d69f37681787aae71e1dbe6ecde766c9913d7ed30333322190682839"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.313+27be3b069.tar.xz"
      sha256 "a9fa6efaf2b07bccedb3225dedef89e0e68b121f3411a327e2e0282d822c3244"
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
