class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1417+20befa4e6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1417+20befa4e6.tar.xz"
      sha256 "a13a48c6f0ce94aeab093f151735af0d58ece1f17b55feb22ded612da7ad3096"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1417+20befa4e6.tar.xz"
      sha256 "ad0c790da6aabf0b4b795ecc08ca4e2f4c50be0dcab69d9d139774fa105942db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1417+20befa4e6.tar.xz"
      sha256 "4aff1aaddf7918549c1d1ad0d41f9065bcf3a3914af450136cf5c88b1633631b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1417+20befa4e6.tar.xz"
      sha256 "0cfcd56c81ea33b08b8238331c10ea939c72e199ce6fc11f28e70d5f004860f6"
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
