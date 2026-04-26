class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.131+73c51c142"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.131+73c51c142.tar.xz"
      sha256 "c639cdff9420a2a3def41eb0c3611f57978a0de847f40445f19a0533e1e0026a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.131+73c51c142.tar.xz"
      sha256 "1dd4803939a7a7e76991c5d41609aeea9552f0bae7708a1c622fc5b833712f7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.131+73c51c142.tar.xz"
      sha256 "6278d660e630e103caac28e811aaa26a8e38e9069fefbc5d97530ce0e4a1b92e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.131+73c51c142.tar.xz"
      sha256 "7a6de3deefbcf1bfca6367a14bdf25d95a233ff92bde05b2e67ab49aef301f21"
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
