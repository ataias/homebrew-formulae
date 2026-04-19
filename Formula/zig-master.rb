class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.27+0dd99c37c"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.27+0dd99c37c.tar.xz"
      sha256 "4ec10b006b26ff420129ed65e9a5d67a0a1c63959d70329a8b294973ab1556b7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.27+0dd99c37c.tar.xz"
      sha256 "75e827582aeb6f415f4b32560655fda0a55b0f4392c56decd41f97441864ee10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.27+0dd99c37c.tar.xz"
      sha256 "550312843f552c860dc7f5f4216b89f43153229c3b2ce10f3ed02e771b5bff1f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.27+0dd99c37c.tar.xz"
      sha256 "c0f91d9439375eb0f71c40f3f17fd6399af06d8bf8e87bd490c29ee906110088"
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
