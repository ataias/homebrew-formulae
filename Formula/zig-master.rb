class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1099+7db2ef610"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1099+7db2ef610.tar.xz"
      sha256 "8298223a6150fb42c292ab2ab793405aafa747548a133ab8c15cbbcd3d4012e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1099+7db2ef610.tar.xz"
      sha256 "93699ac2c3c9eb7acdeed2914b4361cda5ad29d40a21c5550fd8a2b85963955b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1099+7db2ef610.tar.xz"
      sha256 "174d3a2f67c3bc05fa47b9509ccd340f2f02f95966e92346c7ce1e670a812d66"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1099+7db2ef610.tar.xz"
      sha256 "8f30d8405a6123f0c7111c8a4c5aee7e730173135c5ddcc9424527a43c5bbd7b"
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
