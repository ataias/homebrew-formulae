class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.76+ff612334f"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.76+ff612334f.tar.xz"
      sha256 "7ad7b7b9120c6344ee5a7cce54f0f26c52991d47eb65323be935616b442fdfd8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.76+ff612334f.tar.xz"
      sha256 "936a88ba86809f3adcb3a97689ff2de64e98118c57db51bab5ecf1fdc6c44c0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.76+ff612334f.tar.xz"
      sha256 "1a8b8888fb9d69636d33c5afc351d9423e6583212c6a652134fbe9f0adcbb460"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.76+ff612334f.tar.xz"
      sha256 "c0e69671184873471a0a91359971100ed0aa0b391aa94905f8b8c90b2cc16696"
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
