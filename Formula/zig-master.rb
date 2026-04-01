class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3059+42e33db9d"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3059+42e33db9d.tar.xz"
      sha256 "368125b2996d69eea3b2612f8adbd504675d9aa8462b34d5c1a798df705c1b65"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3059+42e33db9d.tar.xz"
      sha256 "93657cdfadd57dc4d573634ad989a8d8cebbf20d2e7f84a393cf09bbe1a26101"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3059+42e33db9d.tar.xz"
      sha256 "337ddc5bb84fd0196c10a3a61dae828138917b2e84b9009680ff663ff0cbc14e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3059+42e33db9d.tar.xz"
      sha256 "a3180445be902d177e137f5352efa0d1733eb7f0061c12b40363bf173d5a4518"
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
