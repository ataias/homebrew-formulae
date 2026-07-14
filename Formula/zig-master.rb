class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1397+4331ba0fb"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1397+4331ba0fb.tar.xz"
      sha256 "027a751c994b5d4e658c0999c34f5d704829aa2dbf862178b37ee7fd3dde1887"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1397+4331ba0fb.tar.xz"
      sha256 "bfe63e7f921f7a500c904ca52670beb61ab07fca03ecc6b64396fa5a40059f95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1397+4331ba0fb.tar.xz"
      sha256 "e458af4af2aface8b2d69a7de8b17cbe4537be4804c98322c703d98de5691535"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1397+4331ba0fb.tar.xz"
      sha256 "74c7124fb69fd31bed0f613fe938a1979425589a1fd77baa4f550117fee47f6c"
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
