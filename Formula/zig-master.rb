class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.135+9df02121d"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.135+9df02121d.tar.xz"
      sha256 "b34f603f291eb25ca80c4d2233106d080ce8d39929cb0299977db614c7a0ac6e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.135+9df02121d.tar.xz"
      sha256 "f2a386143fc1a30854d14a881debf5e312810f23d84b26e19c5c82909bb57958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.135+9df02121d.tar.xz"
      sha256 "6c18c12d03a3570e250d90770e099fcd9d235c86b9d95a4db0fbbe86a80d8336"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.135+9df02121d.tar.xz"
      sha256 "e909c714463eb94386a1d8a965a353c81ff5f25a56a2d962c926c66be745e1bc"
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
