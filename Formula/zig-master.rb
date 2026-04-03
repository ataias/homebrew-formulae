class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3066+da78940dd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3066+da78940dd.tar.xz"
      sha256 "8fbdec1cf3f03134eecd01a1c21e00bdf3fe4cf4b185576ed41a7b3ab69c7fe6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3066+da78940dd.tar.xz"
      sha256 "37f0b362d3b5f5025198c0d08b33ae3ab521fef99c00800964153dda8ae0dbc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3066+da78940dd.tar.xz"
      sha256 "56546d83c92e9893c9fdeefe03d05a309859375f90144f5f3a7cea1a5be188ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3066+da78940dd.tar.xz"
      sha256 "5e181657e0d159bad97ff638d1f73310f1aa2fc48618960de564ac1f777ebe93"
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
