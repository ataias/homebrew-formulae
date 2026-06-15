class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.857+2b2b85c5f"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.857+2b2b85c5f.tar.xz"
      sha256 "e04a527ba6d10879cff12105cbd4938347c31a5423a4ba4d8c907d759521168f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.857+2b2b85c5f.tar.xz"
      sha256 "f956e053a39c0f5dff6142d2153dca5e420bc19fc3514cbad7472e0a2cd03e25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.857+2b2b85c5f.tar.xz"
      sha256 "c86f1fb17500d63ed47918922412a35b0800ad8d22795e6725765cd41304ff60"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.857+2b2b85c5f.tar.xz"
      sha256 "54989afcf22cf8430ce9112b390ec632e594239a75c3fe626b45381748d72e23"
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
