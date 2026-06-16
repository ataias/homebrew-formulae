class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.864+3deb86baf"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.864+3deb86baf.tar.xz"
      sha256 "42c4ba40fb6bad4e0927175d47c6d3c60a174de951837f7c1fe03cc9f177df8d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.864+3deb86baf.tar.xz"
      sha256 "48eb32c97e11c921c4fd1139bd15c2eb33aeea9af00394768773d0d7d3611071"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.864+3deb86baf.tar.xz"
      sha256 "58bbbdecc0b00089abdc7f006b1c2dc660e4bf946eda94a4b6618f6fd6585b75"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.864+3deb86baf.tar.xz"
      sha256 "527752a4e615dd67a2ce733246aec30bd3303b8b959532540963f900c27f94b7"
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
