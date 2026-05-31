class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.607+456b2ec07"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.607+456b2ec07.tar.xz"
      sha256 "4f3143fa5a9723754b9516be6f9bc23fda2743abf1144570ae67ac875f5d2a09"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.607+456b2ec07.tar.xz"
      sha256 "3315ff00c1d90d2472c1bef7b583e3a1adb4b9160b3452aad828b077ad7dd5fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.607+456b2ec07.tar.xz"
      sha256 "96a1465b932e23eebcd9598c82d319d316b41529b6e0ef1bcff48eaf5e3cb15a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.607+456b2ec07.tar.xz"
      sha256 "19275107de7b89ec33d29b50f00997c1381c524d1e33b728472dcbd551da2e33"
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
