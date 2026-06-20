class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.902+7255f3e72"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.902+7255f3e72.tar.xz"
      sha256 "c68c6d29c7ba6273705c40de7f68c058c9c943c85892cb028a3fc4fdc41e6970"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.902+7255f3e72.tar.xz"
      sha256 "94fa4db35a2d746b302620435f99d057fa972ad78010656d4157160dbd36c7aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.902+7255f3e72.tar.xz"
      sha256 "88d894b491fffe13dd6a3a8cdbaf68cc8fc68a5a1d1e914d7a7317f15072c3f1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.902+7255f3e72.tar.xz"
      sha256 "6f31ed18c8dc7da5995e54a2d39a50159b810e8c23ab9bcdb04be29230a5d25a"
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
