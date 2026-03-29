class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3028+a85495ca2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3028+a85495ca2.tar.xz"
      sha256 "18febab30e3c65fef6c2ea80e339668e2d0b17a303ea7e3dd7368af139142e11"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3028+a85495ca2.tar.xz"
      sha256 "94233317d2712d0071878411bf8faae141768e337691ffcd45cce883858275a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3028+a85495ca2.tar.xz"
      sha256 "f8419b619e3c6a9c913b4cf5b3dab70b869e92b18f30851ee9549c8e1533c247"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3028+a85495ca2.tar.xz"
      sha256 "08cf4ad6487d59bfca56f5c2cb1ac8f02e17d11fcf725b905b752682d6674071"
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
