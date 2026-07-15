class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1398+cb5635714"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1398+cb5635714.tar.xz"
      sha256 "1857c99ceec2d4f1e536c68c07e7270ee06a8311f81751f8142425365734b05c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1398+cb5635714.tar.xz"
      sha256 "cbb581620a8cd5c3a77d2af6dd333e6356f7f8533e20388cae65144185f5af1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1398+cb5635714.tar.xz"
      sha256 "02bb2114b490eb8b4c0cf1bf793ba5fd2583a8e280215a6a516ce9a663e5dcb4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1398+cb5635714.tar.xz"
      sha256 "b1ce3b71d7eac51655fdeb89057e6a2c6c689b25c3e0c995a1caa1d5a5f5cd57"
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
