class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.986+f3544a707"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.986+f3544a707.tar.xz"
      sha256 "fdea929d9e1883a2721f8cb877fb9bde200b4143a81636a91ba33934f4d2a2d8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.986+f3544a707.tar.xz"
      sha256 "91dc95d92b6b12627dcd56c3eb292b67c76dbc2ed90fcfabf5fae3a64036ce5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.986+f3544a707.tar.xz"
      sha256 "ed0fe8900cf96659b64f8ee154afb6add9ce0a792dacaa94641105ef582bf2fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.986+f3544a707.tar.xz"
      sha256 "d83be7f55772f48c14131270cb4c6058f4d61d713c45cec2af1cb2dd75472eaa"
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
