class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1422+e863bf3be"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1422+e863bf3be.tar.xz"
      sha256 "836d56cabb48f4c9250d9ad12234d9595a644d03c82c47279925231e6ab85af0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1422+e863bf3be.tar.xz"
      sha256 "fc301448a1b83684094bea3ed336ce7c3a3f2c89580f088818a039ac3bf2139c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1422+e863bf3be.tar.xz"
      sha256 "449c507aa8be2d0c4cf20653cca2256b278938913c183d85441a529649054c49"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1422+e863bf3be.tar.xz"
      sha256 "029b14cd9bc84b30f7766c0ec568d214ca4ce36049749b78d9eb37bb6f4e28ce"
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
