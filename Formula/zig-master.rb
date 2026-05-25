class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.340+c02d39a21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.340+c02d39a21.tar.xz"
      sha256 "fd38a3e02d9fad3163fe317bb0af318609677a38d584109d7771eac542cb7a44"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.340+c02d39a21.tar.xz"
      sha256 "a5aa8e70bc6615af594e1e28c150abe2bab55de4e79a49f58a1dfdaa0c941cab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.340+c02d39a21.tar.xz"
      sha256 "3306e84041038cc47816b12012ffa542f018299131b3dd1dd7d931d11eff12ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.340+c02d39a21.tar.xz"
      sha256 "04067baea80bc3959aab1233f720673b1d6d320c17a95b3dfa126473919ef2ee"
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
