class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.356+3140b375f"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.356+3140b375f.tar.xz"
      sha256 "ffd4102c5f909f806cfb137b7cb6599d3ad8476ce800dad99a6d3f9a8b2883c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.356+3140b375f.tar.xz"
      sha256 "d2f4dc47c528062473234f7d380a999ed2227172e2b352c53b4301edd990e713"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.356+3140b375f.tar.xz"
      sha256 "a708a47f8d47c2dfa1d7ae63731c991754af29b65ed1512afea0b4a326036093"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.356+3140b375f.tar.xz"
      sha256 "878101f0247e1084cef831101b8ed6466ac3d01f589d496390b61d1bb0635aab"
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
