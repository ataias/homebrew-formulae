class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1282+c0f9b51d8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1282+c0f9b51d8.tar.xz"
      sha256 "6e25624fd871a76d2604cf7c5ab0984c645b81008607c6ea3d974a3b68405988"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1282+c0f9b51d8.tar.xz"
      sha256 "f8103f2bb178ef4c2bbcae62a5480c2327e7aebd4a6dc01345837645be433cf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1282+c0f9b51d8.tar.xz"
      sha256 "428dac6f697b908a5f64b4c383d57ed3cd40c8968e6440d72f5917819f39c7ae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1282+c0f9b51d8.tar.xz"
      sha256 "6d81dec0152f6f11f8a12a84a73535b65070fe01b14a1ce75423870d65b3f270"
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
