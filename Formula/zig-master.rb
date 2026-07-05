class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1245+efd6f190f"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1245+efd6f190f.tar.xz"
      sha256 "d8ea61e5f16b13f2fadf1420f2bfa4ff5dca5a503853c6b1e674b44cb8837f30"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1245+efd6f190f.tar.xz"
      sha256 "ca096cee4f2bd5be056b7b21cefb140aa75b7abf2841c6b13fc9dd21c298c6cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1245+efd6f190f.tar.xz"
      sha256 "4d205a1ab785a4a389247054b0a8b8a261da3ecc77e9726485b7449c7ceeed60"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1245+efd6f190f.tar.xz"
      sha256 "aecabe2449260487906c6411e707e3c5426dc9b8f9c328640b7a5bc67c262492"
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
