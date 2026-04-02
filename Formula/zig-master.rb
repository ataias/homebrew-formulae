class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3061+9b1eaad13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3061+9b1eaad13.tar.xz"
      sha256 "25ac3b6b8ce64e0d4750955c7878145b1b6b3eb80795c76992138cfef9265ab2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3061+9b1eaad13.tar.xz"
      sha256 "14147b7a9451fa63a67b22ea89232b0b63a65da6b4cde7ed410057c7e725792e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3061+9b1eaad13.tar.xz"
      sha256 "1fb84d8b583f23d271b44642c96c9e0ca4e4f113d0f181bb97c4c504b4af9744"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3061+9b1eaad13.tar.xz"
      sha256 "fc3af37e3d8d5caf0246f6afeda59f3c5f69a24c5b0ac97ad0e5a73d76af214b"
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
