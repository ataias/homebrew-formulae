class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.224+c166c49b1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.224+c166c49b1.tar.xz"
      sha256 "d9c3bb453b637e3f49da52404f71bf0ccc0d082e480e80c6bc534e2c42637bb9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.224+c166c49b1.tar.xz"
      sha256 "67ed4b68d6c91ed26f0a76837bdb9067b5da97cdc288a6cb04bb6986d601693a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.224+c166c49b1.tar.xz"
      sha256 "2d84e767b703921903d1b9cc02346182b7e5fdb20ad84548007053255e3f7dbb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.224+c166c49b1.tar.xz"
      sha256 "a90bb6c69b4b48ac1d50e4a41af67ca2e479fd7e62382705643f2132d3bcda03"
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
