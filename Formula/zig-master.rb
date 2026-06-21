class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.931+84f84267c"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.931+84f84267c.tar.xz"
      sha256 "3eb3155861a9a3330b3056449537b818461f187557377622621b3ce3bed7a47e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.931+84f84267c.tar.xz"
      sha256 "db78d16e0eb6a1224b006ac4cdce2c5b9317953ca1dff50aa35ce8d27c258469"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.931+84f84267c.tar.xz"
      sha256 "8941e3e135def4fd0e5a6345613cca2bc88eefd83cf40a1954d2ee8c9c6ea9f1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.931+84f84267c.tar.xz"
      sha256 "eab0b059fd4340f74afc2e60db86342bb9bc772250f1ba9c47aee7a0b7508f94"
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
