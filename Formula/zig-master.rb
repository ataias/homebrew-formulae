class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.9+046002d1a"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.9+046002d1a.tar.xz"
      sha256 "a924165f5ab4d70a12e60109fccabb1f61d2b8a16b5c8cdbc32450f4389f04f7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.9+046002d1a.tar.xz"
      sha256 "c01a49b5fc1fd4ee32d518fab1c22b8162b5a3cfb28071b75d7989d65b7d00ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.9+046002d1a.tar.xz"
      sha256 "c14f23dd36262e7e30082fb1baf7b6478554a4830751f8ad0451cea112d670f1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.9+046002d1a.tar.xz"
      sha256 "0b7617af16610f1d56ef12cbb96b8d4a1be349257d4b43cd1a30344eac204bcf"
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
