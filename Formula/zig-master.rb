class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.667+0569f1f6a"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.667+0569f1f6a.tar.xz"
      sha256 "e67f8b37c263280b7c00a47cff809ccaa4e0f2884010b5291d8ac4b788e184ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.667+0569f1f6a.tar.xz"
      sha256 "b3939a41facd0bb96bb44dbd1981fd6c42a0386dde512586e365bb35168fcbba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.667+0569f1f6a.tar.xz"
      sha256 "efcfa46435bedd9b5390789d3ce460450b77d4def611cc973e725cfe9a541c0f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.667+0569f1f6a.tar.xz"
      sha256 "986e68c1861458b21ce9229a4d094d8c14e1e1cf4b1a60f28e4dfb70b17146f7"
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
