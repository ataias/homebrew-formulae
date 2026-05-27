class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.387+31f157d80"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.387+31f157d80.tar.xz"
      sha256 "8a25dd0dcd57ef7050e6e07be2ad03ec777b793a7689275d6b6cfc8980f5a2a9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.387+31f157d80.tar.xz"
      sha256 "4c1173d2f6be21c26c76946ae934c5a1e0ae078d3a93eef2005cf73bfed60c3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.387+31f157d80.tar.xz"
      sha256 "33923704ec77d79661170d788d90aa9a9a79cc6841674035b06a7ae925017851"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.387+31f157d80.tar.xz"
      sha256 "1915de5522c2fbea68d1b1864b230d9a25cc5d257312d960c895a8359efe9c70"
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
