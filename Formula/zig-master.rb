class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.296+a85a29ae4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.296+a85a29ae4.tar.xz"
      sha256 "4e7f281c1862ef8cbecf51c6541907acfc250e2dbcfcbeeb7618d1b8b19ecf0a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.296+a85a29ae4.tar.xz"
      sha256 "359d7771a61e9377ef3b14d01a621ffac4802221cf13c5175bfa50e7d19ce0f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.296+a85a29ae4.tar.xz"
      sha256 "3799f3c995bb68f7958835138fbe63d30349b2193a1fb59d0e6cab3fdbc935ec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.296+a85a29ae4.tar.xz"
      sha256 "3d9a0f2c9a06ebfaba41fcd9b5489fa8762b8ba6fe304b4c274880641d27fbfa"
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
