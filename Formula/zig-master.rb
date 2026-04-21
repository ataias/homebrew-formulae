class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.44+0177cb57c"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.44+0177cb57c.tar.xz"
      sha256 "4774adbfc42dbef22362562a943abc3f685eb3248e31a6ca22c2156d09405ba0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.44+0177cb57c.tar.xz"
      sha256 "54c568e957e9072a7bd02be131d03962123ae6c959959a417c82abcd8613c313"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.44+0177cb57c.tar.xz"
      sha256 "be22a5e71bf03fefe82513b7a7d0c96c6e7fa7c718b683852dd0489a663510fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.44+0177cb57c.tar.xz"
      sha256 "e5b6519775911b5fdefb3c90f26dcd63ad5dc02c703071793c18f9b403e7aef6"
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
