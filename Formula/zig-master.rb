class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1275+59a628c6d"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1275+59a628c6d.tar.xz"
      sha256 "cabf8db92c381bda5a160fda8fa54ffa64f0964316c0d5b1dc385a7437e1691b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1275+59a628c6d.tar.xz"
      sha256 "a4f73cfbdee89168eb493eb5df1fba4f1b7eead376d56a9f2a4c242ac13cc725"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1275+59a628c6d.tar.xz"
      sha256 "8416c149489e644f81fcb517e9cf0a1e2975fbcc0e05639671054beddbbefcbb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1275+59a628c6d.tar.xz"
      sha256 "04e8baddd0497042889d3ee9ae53238e0655c2b9777039827b131487a7465d16"
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
