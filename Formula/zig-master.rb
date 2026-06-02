class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.644+3de725074"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.644+3de725074.tar.xz"
      sha256 "c95e564d3655d90672409f7f6fba63fecce3f24f98dbbe8ccbe26a6b62a12bf0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.644+3de725074.tar.xz"
      sha256 "8f6911f281418b97df7e60b043880e843e4c4cc7536afd8fc2345a63654cf14c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.644+3de725074.tar.xz"
      sha256 "7221b75ac9f322adf730e4752b368dcf0cda6ded1e2a31cc100823982c534ce4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.644+3de725074.tar.xz"
      sha256 "b3f9cc7098a72d0ffe5bbd339f572344338d30c32419a8f4b244532fc00409bf"
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
