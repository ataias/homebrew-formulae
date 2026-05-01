class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.215+8c5542bd3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.215+8c5542bd3.tar.xz"
      sha256 "ba3854866a47b377bfb30ca58a819f79f3d578b6dfe42640cddb3eeab539fb56"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.215+8c5542bd3.tar.xz"
      sha256 "994e0a660bc08e12f5e6f7889d4c5a7e5be8274c5067490e597331e3e5781708"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.215+8c5542bd3.tar.xz"
      sha256 "292438c0780f27726a8ee9ed032c31fa3bd5f873e0d84d7750d2eeaa2130adb2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.215+8c5542bd3.tar.xz"
      sha256 "5437482a5ea17b99d564ea2635d385977adf2f4ba4e1375ab2b2ed0bc5d3db9c"
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
