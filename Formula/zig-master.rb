class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.304+9787df942"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.304+9787df942.tar.xz"
      sha256 "95d47d5bdb520544ffcb31cb56831009d7f5b2176546d0ea1411e59946ac10d6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.304+9787df942.tar.xz"
      sha256 "3fcd618bca6dfb96145162832de77240a3f847f8ba18baf32592e03124d8b30b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.304+9787df942.tar.xz"
      sha256 "e22447f474155b6b849498cb6c7bc75c233733e5c63df78006d61000a28b0d1f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.304+9787df942.tar.xz"
      sha256 "cc96628030e54ad9ff38df7bb858bd7c05dd522977a7c73e900c730f1d00be75"
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
