class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.877+a3ae499dc"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.877+a3ae499dc.tar.xz"
      sha256 "5c7e8006550393a7e65a72450077c1f05ff9c4963cf34cd83aa3c32e0db51553"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.877+a3ae499dc.tar.xz"
      sha256 "ec9b05ef7fba3068bac167bb8b3f1f931a32c4b5a66af00266b9f7e53e617aec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.877+a3ae499dc.tar.xz"
      sha256 "790ce15dc97786ec5c3968a48a09ed6968218ea4cbd542ebe2aa19e0f83fb935"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.877+a3ae499dc.tar.xz"
      sha256 "5c843c0b11faa95f0128cf89d25d8f2a8f7ba53ffe7ebbd7ed6cca65236aeadc"
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
