class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.639+284ab0ad8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.639+284ab0ad8.tar.xz"
      sha256 "0f57666f4913dc1acd769c6d038ac3e2af7815800ea5419c2db482b720b3128f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.639+284ab0ad8.tar.xz"
      sha256 "dcd886d0872cde3d426cec62716a74259f5c83a26a02bbc611fb576e244b7056"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.639+284ab0ad8.tar.xz"
      sha256 "1cbbb0d49dfb073c58b52b43166736b04d884ddc72e3c23110d88b25c3798031"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.639+284ab0ad8.tar.xz"
      sha256 "b95c7cd06446e7ac83b34554c70f1f99a92d1abab1ff2d222b2b2a4ca0fd250d"
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
