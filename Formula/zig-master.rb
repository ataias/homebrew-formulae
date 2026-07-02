class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1158+1d1193aa7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1158+1d1193aa7.tar.xz"
      sha256 "6cbe8b5f233e3794e440c76ae565c88fa9f12e394106d8a34dbcbe2d659eb2bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1158+1d1193aa7.tar.xz"
      sha256 "511fadf165623683419429e9d37a49284c9929db3b2746a0c1fa2bb3dae306e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1158+1d1193aa7.tar.xz"
      sha256 "36756d399915678a572d6cc565008a9b6b469a4004af49efece205f13adac749"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1158+1d1193aa7.tar.xz"
      sha256 "e5ff2fce71cb195dff6242b4f136df3ee18a7e456ba5333c0216cb59e37634eb"
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
