class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1426+58a94eaae"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1426+58a94eaae.tar.xz"
      sha256 "cf138c614ad916fb7c0c3507e5d5d54eb7bc45695785bc63d9fb7f4107d12eca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1426+58a94eaae.tar.xz"
      sha256 "f5d2b1cdfc048214316fa5b9e8c915aab802a7bad32d95e278918be439538fcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1426+58a94eaae.tar.xz"
      sha256 "337c5ec46387ec03fcfbbdf2ca7cbf386d8ccb5f47dd1c1fa2f1f4c5583c3ad3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1426+58a94eaae.tar.xz"
      sha256 "91281bf3deaa1d8055b0ad7b3b10c29e7f1f9db666fb5f5182440b1f1d3e722b"
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
