class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1257+67b05e521"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1257+67b05e521.tar.xz"
      sha256 "6851f9c22005b7c4e8ff059d2988c30e0c5b60bd8b0611c348a5a7e1325811bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1257+67b05e521.tar.xz"
      sha256 "dab81d81916c85573a3b498a44a7aebb2c41bf5ce966f8d9681acb78d7b2f444"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1257+67b05e521.tar.xz"
      sha256 "45cf6d4f8ad1ffd1072cf3502efe5af25b719091dfb7f0c16d04df0fb5ef613a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1257+67b05e521.tar.xz"
      sha256 "408551014c404c6aba8d42d7d244550e402eb6a2678253f813f1bac021a450bb"
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
